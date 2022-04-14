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

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //        stackView.backgroundColor = .blue
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()

    var post: Post?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        layout()

    }

    var postButton: UIButton = {
        let postButton = UIButton()
        postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.layer.cornerRadius = 4
        postButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        postButton.layer.shadowRadius = 4
        postButton.layer.shadowColor = UIColor.black.cgColor
        postButton.layer.shadowOpacity = 0.7
        postButton.setTitle("Посмотреть пост", for: .normal)
        postButton.backgroundColor = .blue
        postButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return postButton
    }()

    @objc private func tapAction(){
        let postVC = PostViewController()
        var newPostTitle = self.post?.title
        newPostTitle = "Новый пост"
        postVC.title = newPostTitle

        navigationController?.pushViewController(postVC, animated: true)
    }

    var postButtonTwo: UIButton = {
        let postButton = UIButton()
        postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.layer.cornerRadius = 4
        postButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        postButton.layer.shadowRadius = 4
        postButton.layer.shadowColor = UIColor.black.cgColor
        postButton.layer.shadowOpacity = 0.7
        postButton.setTitle("Show post", for: .normal)
        postButton.backgroundColor = .red
        postButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return postButton
    }()

    func layout(){
        view.addSubview(stackView)
        [postButton, postButtonTwo].forEach {stackView.addArrangedSubview($0)}

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

    }

}
