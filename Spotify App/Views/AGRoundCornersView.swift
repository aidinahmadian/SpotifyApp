//
//  AGRoundCornersView.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 3/17/21.
//

import UIKit
import Foundation

class AGRoundCornersView: UIView {
    
    fileprivate var roundCornerRadius: CGFloat = 0.0
    fileprivate var cornerRect: UIRectCorner = []
    fileprivate var cornerCustom: [AGCornerTypes] = []
    
    enum AGCornerTypes {
        case topLeft(CGFloat)
        case topRight(CGFloat)
        case bottomLeft(CGFloat)
        case bottomRight(CGFloat)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if cornerRect != [] {
            self.roundCorners(self.cornerRect, radius: self.roundCornerRadius)
        }
        
        if !cornerCustom.isEmpty {
            self.roundCorner(with: cornerCustom)
        }
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        self.cornerRect = corners
        self.roundCornerRadius = radius
        
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: cornerRect,
                                    cornerRadii: CGSize(width: roundCornerRadius, height: roundCornerRadius))
        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }
    
    func roundCorner(with corners: [AGCornerTypes]){
        self.cornerCustom = corners
        
        var topLeft: CGFloat = 0.0
        var bottomLeft: CGFloat = 0.0
        var bottomRight: CGFloat = 0.0
        var topRight: CGFloat = 0.0
        
        for corner in corners {
            switch corner {
            case .topLeft(let value): topLeft = value; break;
            case .bottomLeft(let value): bottomLeft = value; break;
            case .bottomRight(let value): bottomRight = value; break;
            case .topRight(let value): topRight = value; break;
            }
        }
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: bounds.width - topRight, y: 0))
        path.addLine(to: CGPoint(x: topLeft, y: 0))
        path.addQuadCurve(to: CGPoint(x: 0, y: topLeft), controlPoint: .zero)
        path.addLine(to: CGPoint(x: 0, y: bounds.height - bottomLeft))
        path.addQuadCurve(to: CGPoint(x: bottomLeft, y: bounds.height), controlPoint: CGPoint(x: 0, y: bounds.height))
        path.addLine(to: CGPoint(x: bounds.width - bottomRight, y: bounds.height))
        path.addQuadCurve(to: CGPoint(x: bounds.width, y: bounds.height - bottomRight), controlPoint: CGPoint(x: bounds.width, y: bounds.height))
        path.addLine(to: CGPoint(x: bounds.width, y: topRight))
        path.addQuadCurve(to: CGPoint(x: bounds.width - topRight, y: 0), controlPoint: CGPoint(x: bounds.width, y: 0))
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        layer.mask = shape
    }
}
