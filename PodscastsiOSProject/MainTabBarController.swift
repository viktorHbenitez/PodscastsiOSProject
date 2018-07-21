//
//  MainTabBarController.swift
//  PodscastsiOSProject
//
//  Created by Victor Hugo Benitez Bosques on 20/07/18.
//  Copyright © 2018 Victor Hugo Benitez Bosques. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().prefersLargeTitles = true
        tabBar.tintColor = .purple
        
        setupViewController()
        
        
    }
    
    
    // MARK:- Setup functions
    func setupViewController(){
        
        // Should use genericNavigationController
        let favoriteNavController = UINavigationController(rootViewController: ViewController())
        favoriteNavController.viewControllers.first?.navigationItem.title = "Prueba"
        favoriteNavController.tabBarItem.title = "Favorite"
        favoriteNavController.tabBarItem.image = #imageLiteral(resourceName: "favorites")
  
        viewControllers = [
            favoriteNavController,
            genericNavigationController(for: ViewController(), title: "Search", image: #imageLiteral(resourceName: "search")),
            genericNavigationController(for: ViewController(), title: "Download", image: #imageLiteral(resourceName: "downloads"))
            
        ]
    }
    
    
    
    // MARK:- Helpers Functions
    fileprivate func genericNavigationController(for rootViewController: UIViewController,
                                                  title: String,
                                                 image: UIImage ) -> UIViewController{
        
        let navigationController = UINavigationController(rootViewController: rootViewController)
//        navigationController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        
        return navigationController
    }
    
    
    
    
}
