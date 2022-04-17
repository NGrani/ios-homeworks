//
//  Timeline.swift
//  Navigation
//
//  Created by Георгий Маркарян on 09.04.2022.
//

import UIKit

struct Post {
    var title: String
}

class FeedViewController: UIViewController {

    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        tapButton()
    }
    private func tapButton(){
        let showPost = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        showPost.center = view.center
        showPost.setTitle("Открыть пост", for: .normal)
        showPost.backgroundColor = .green
        showPost.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        view.addSubview(showPost)

    }

    @objc private func tapAction(){
        let postVC = PostViewController()
        var newPostTitle = self.post?.title
        newPostTitle = "Новый пост"
        postVC.title = newPostTitle

        navigationController?.pushViewController(postVC, animated: true)

    }


}
