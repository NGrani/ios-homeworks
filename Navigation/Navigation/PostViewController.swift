//
//  PostViewController.swift
//  Navigation
//
//  Created by Георгий Маркарян on 09.04.2022.
//

import UIKit


class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .purple
//        title = "mmm"
        tapBarButton()

    }
    let feedVC = FeedViewController()
    
    private func tapBarButton(){
        let showPost = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(tapAction))
        navigationItem.rightBarButtonItem = showPost

    }

    @objc private func tapAction(){
        let infoVC = InfoViewController()
        
        present(infoVC, animated: true)
    }

}
