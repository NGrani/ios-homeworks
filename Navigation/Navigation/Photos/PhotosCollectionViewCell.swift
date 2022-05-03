//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Георгий Маркарян on 22.04.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {
    
    private var photoImage:UIImageView = {
        let photoImage = UIImageView()
        photoImage.translatesAutoresizingMaskIntoConstraints = false
        photoImage.contentMode = .scaleAspectFit
        photoImage.backgroundColor = .black
        photoImage.clipsToBounds = true
        return photoImage
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        customizeCell()
        layout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupCell(_ model: PhotosModelCollection){
        photoImage.image = model.image
    }

    func layout() {
        contentView.addSubview(photoImage)

        NSLayoutConstraint.activate([
            photoImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    private func customizeCell(){
        photoImage.layer.cornerRadius = 6
    }
}
