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
    let loginVC = LogInViewController()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupControllers()
    }
    
    private func setupControllers(){
        let navigationFeedController = UINavigationController(rootViewController: feedVC)
        let navigationloginController = UINavigationController(rootViewController: loginVC)

        feedVC.tabBarItem.title = "Новости"
        feedVC.tabBarItem.image = UIImage(systemName: "house")
        feedVC.navigationItem.title = "Новости"
        loginVC.tabBarItem.title = "Профиль"
        loginVC.tabBarItem.image = UIImage(systemName: "person")
        loginVC.navigationItem.title = "Профиль"
        loginVC.navigationController?.navigationBar.isHidden = true

        viewControllers = [navigationloginController, navigationFeedController]
    }

}
