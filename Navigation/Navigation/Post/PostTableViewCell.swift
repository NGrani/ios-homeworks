//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Георгий Маркарян on 18.04.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {

    private let cellView: UIView = {
        let cellView = UIView()
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = .white
        return cellView
    }()

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

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(_ model: PostModel){
        postImage.image = model.image
        autorLabel.text = model.author
        descriptionLabel.text = model.description
        likeLabel.text = "like \(model.likes)"
        viewsLabel.text = "views \(model.views)"
    }

    func layout() {
        [cellView, postImage, autorLabel ,descriptionLabel, likeLabel, viewsLabel].forEach { contentView.addSubview($0)}

        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])

        NSLayoutConstraint.activate([
            autorLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 16),
            autorLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            postImage.topAnchor.constraint(equalTo: autorLabel.bottomAnchor, constant: 12),
            postImage.widthAnchor.constraint(equalTo: cellView.widthAnchor),
            postImage.heightAnchor.constraint(equalTo: cellView.widthAnchor)
        ])

        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: postImage.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            likeLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likeLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 16),
            likeLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: 8)
        ])

        NSLayoutConstraint.activate([
            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: 8)
        ])

    }

}
