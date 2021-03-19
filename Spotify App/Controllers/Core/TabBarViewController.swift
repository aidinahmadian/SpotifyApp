//
//  tabBarViewController.swift
//  Spotify App
//
//  Created by Aidin Ahmadian on 3/11/21.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.tintColor = .white
        self.tabBar.isTranslucent = false
        UITabBar.appearance().barTintColor = #colorLiteral(red: 0.152813971, green: 0.1568908393, blue: 0.156884402, alpha: 1)
        
        let vc1 = HomeViewController()
        let vc2 = SearchViewController()
        let vc3 = LibraryViewController()
        
        vc1.title = ""
        vc2.title = "Search"
        vc3.title = "Library"
        
        vc1.navigationController?.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationController?.navigationItem.largeTitleDisplayMode = .always
        vc3.navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        let nav1 = UINavigationController(rootViewController: vc1)
        let nav2 = UINavigationController(rootViewController: vc2)
        let nav3 = UINavigationController(rootViewController: vc3)
        
        nav1.navigationBar.tintColor = .label
        nav2.navigationBar.tintColor = .label
        nav3.navigationBar.tintColor = .label
        
        nav1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 1)
        nav2.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        nav3.tabBarItem = UITabBarItem(title: "Library", image: UIImage(systemName: "music.note.list"), tag: 3)
        
        nav1.navigationBar.prefersLargeTitles = true
        nav2.navigationBar.prefersLargeTitles = true
        nav3.navigationBar.prefersLargeTitles = true
        
        setViewControllers([nav1, nav2, nav3], animated: false)
    }
}
