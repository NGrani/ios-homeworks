//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Георгий Маркарян on 22.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private lazy var photoModelCollection: [PhotosModelCollection] = PhotosModelCollection.makePhotosCollection()

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.backgroundColor = .white
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)

        return collection
    }()

    private let viewUnderImage: UIView = {
        let viewUnderImage = UIView()
        let profileVC = ProfileViewController()
        viewUnderImage.translatesAutoresizingMaskIntoConstraints = false
        viewUnderImage.backgroundColor = .black
        viewUnderImage.alpha = 0
        viewUnderImage.frame = profileVC.view.frame
        return viewUnderImage
    }()

    private var closeProfileImageButton: UIButton = {
        let closeProfileImageButton = UIButton()
        closeProfileImageButton.translatesAutoresizingMaskIntoConstraints = false
        closeProfileImageButton.setImage(UIImage(systemName: "multiply"), for: UIControl.State.normal)
        closeProfileImageButton.contentMode = .scaleAspectFill
        closeProfileImageButton.alpha = 0
        closeProfileImageButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return closeProfileImageButton
    }()

    @objc private func closeAction(){
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn){
            self.closeProfileImageButton.alpha = 0.0
        } completion: { _ in
            UIView.animate(withDuration: 0.9, delay: 0, options: .curveEaseIn) { [self] in

                if let removable = view.viewWithTag(10){
                   removable.removeFromSuperview()
                }
                viewUnderImage.alpha = 0.0
                collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray
        layout()
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }

    private func layout(){
        view.addSubview(collectionView)
        view.addSubview(viewUnderImage)
        view.addSubview(closeProfileImageButton)

        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        NSLayoutConstraint.activate([
            closeProfileImageButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            closeProfileImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
    }
}

// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return photoModelCollection.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(photoModelCollection[indexPath.row])
        return cell
    }

}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout{
    private var sideInset: CGFloat { return 8 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 4) / 3
        return CGSize(width: width, height: width)
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

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)

        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseIn) {
            self.viewUnderImage.alpha = 0.8
            self.view.addSubview(cell!)
            cell?.tag = 10
            cell?.transform =  CGAffineTransform(scaleX: 3, y: 3)
            cell?.center = CGPoint(x: collectionView.center.x, y: collectionView.center.y)

            self.view.layoutIfNeeded()
        } completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn){
                self.closeProfileImageButton.alpha = 1
            }
        }
    }
}



