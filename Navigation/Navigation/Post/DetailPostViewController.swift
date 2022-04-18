//
//  DetailPostViewController.swift
//  Navigation
//
//  Created by Георгий Маркарян on 18.04.2022.
//

import UIKit

class DetailPostViewController: UIViewController {

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {

        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())

    private let postImage:UIImageView = {
        let postImage = UIImageView()
        postImage.translatesAutoresizingMaskIntoConstraints = false
        postImage.contentMode = .scaleAspectFit
        postImage.backgroundColor = .black
        postImage.clipsToBounds = true
        return postImage
    }()

    private let autorLabel: UILabel = {
        let autorLabel = UILabel()
        autorLabel.translatesAutoresizingMaskIntoConstraints = false
        autorLabel.numberOfLines = 2
        autorLabel.font = .systemFont(ofSize: 20, weight: .bold)
        autorLabel.textColor = .black
        autorLabel.text = "sometext"
        return autorLabel
    }()

    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = .systemFont(ofSize: 14)
        descriptionLabel.textColor = .systemGray
        descriptionLabel.text = "sometextdecrt"
        return descriptionLabel
    }()

    private let likeLabel: UILabel = {
        let likeLabel = UILabel()
        likeLabel.translatesAutoresizingMaskIntoConstraints = false
        likeLabel.font = .systemFont(ofSize: 16)
        likeLabel.textColor = .black
        likeLabel.text = "like"
        return likeLabel
    }()

    private let viewsLabel: UILabel = {
        let viewsLabel = UILabel()
        viewsLabel.translatesAutoresizingMaskIntoConstraints = false
        viewsLabel.font = .systemFont(ofSize: 16)
        viewsLabel.textColor = .black
        viewsLabel.text = "sometextdecrt"
        return viewsLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
        view.backgroundColor = .white
    }

    func setupDetailPostVC(model: PostModel) {
        postImage.image = model.image
        autorLabel.text = model.author
        descriptionLabel.text = model.description
        likeLabel.text = "like \(model.likes)"
        viewsLabel.text = "views \(model.views)"
    }
    func layout(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [postImage, autorLabel, descriptionLabel, likeLabel, viewsLabel].forEach {contentView.addSubview($0)}

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            autorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            autorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
        ])

        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo: autorLabel.bottomAnchor, constant: 12),
            postImage.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: contentView.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            likeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8)
        ])

        NSLayoutConstraint.activate([
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 8)
        ])


    }
}
