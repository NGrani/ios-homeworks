//
//  MainTabBar.swift
//  Navigation
//
//  Created by Георгий Маркарян on 09.04.2022.
//

import UIKit

class MainTabBar: UITabBarController {

    let profileVC = ProfileViewController()
    let feedVC = FeedViewController()
   

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    private func setupControllers(){
        let navigationProfileController = UINavigationController(rootViewController: profileVC)
        let navigationFeedController = UINavigationController(rootViewController: feedVC)

        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person")
        profileVC.navigationItem.title = "Профиль"
        feedVC.tabBarItem.title = "Новости"
        feedVC.tabBarItem.image = UIImage(systemName: "house")
        feedVC.navigationItem.title = "Новости"


        viewControllers = [navigationProfileController, navigationFeedController]
    }


}
