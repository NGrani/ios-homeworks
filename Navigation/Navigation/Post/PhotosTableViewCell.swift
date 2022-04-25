//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Георгий Маркарян on 22.04.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let cellView: UIView = {
        let cellView = UIView()
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.backgroundColor = .white
        return cellView
    }()
    
    private var photosLabel: UILabel = {
        let PhotosLabel = UILabel()
        PhotosLabel.translatesAutoresizingMaskIntoConstraints = false
        PhotosLabel.font = .systemFont(ofSize: 20, weight: .bold)
        PhotosLabel.textColor = .black
        PhotosLabel.text = "Photos"
        return PhotosLabel
    }()
    
    var tapButton: UIButton = {
        let tapButton = UIButton()
        tapButton.translatesAutoresizingMaskIntoConstraints = false
        tapButton.setImage(UIImage(systemName: "chevron.right"), for: UIControl.State.normal)
        return tapButton
    }()
    
    private lazy var photoModelCollection: [PhotosModelCollection] = PhotosModelCollection.makePhotosCollection()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        
        return collection
    }()
    
    func setupCell(_ model: PhotoModel){
        photosLabel.text = model.photosLabel
    }
    
    func layout() {
        [cellView, photosLabel, tapButton, collectionView].forEach { contentView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 12),
            collectionView.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -12),
            collectionView.heightAnchor.constraint(equalToConstant: 83),
            collectionView.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            photosLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 12),
        ])
        
        NSLayoutConstraint.activate([
            tapButton.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
            tapButton.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -12),
        ])
    }
    
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout{
    private var sideInset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.bounds.height
        return CGSize(width: height, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
}

extension PhotosTableViewCell: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(photoModelCollection[indexPath.row])
        return cell
    }
}



