//
//  Profile.swift
//  Navigation
//
//  Created by Георгий Маркарян on 09.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private let nc = NotificationCenter.default


    private lazy var postModel: [PostModel] = PostModel.makePost()
    private lazy var photoModel: [PhotoModel] = PhotoModel.makePost()
    private lazy var mySection: [[Any]] = [photoModel, postModel]


    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        
        nc.addObserver(self, selector: #selector(keyboardShow), name:  UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(keyboardHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        nc.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func keyboardShow(notification: NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue{
            tableView.contentInset.bottom = keyboardSize.height
            tableView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    @objc private func keyboardHide(){
        tableView.contentInset = .zero
        tableView.verticalScrollIndicatorInsets = .zero
    }

    override func viewWillLayoutSubviews() {
        view.addSubview(tableView)

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

    }
    @objc  func pressAction(){
        let photoVC = PhotosViewController()
        photoVC.title = "Фото"
        navigationController?.pushViewController(photoVC, animated: true)
    }

}
// MARK: - UITableViewDataSource

extension  ProfileViewController: UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return mySection.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySection[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if mySection[indexPath.section] is [PhotoModel]{
            let cell = tableView.dequeueReusableCell(withIdentifier:
                                                        PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.setupCell(photoModel[indexPath.row])
            cell.tapButton.addTarget(self, action:  #selector(pressAction), for: .touchUpInside)
            return cell
        } else if  mySection[indexPath.section] is [PostModel]{
            let cell = tableView.dequeueReusableCell(withIdentifier:
                                                        PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(postModel[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
}


// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate{

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 0:
            let header = ProfileHeaderView()
            return header
        default:
            return nil
        }

    }

        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            switch section {
            case 0:
                return UITableView.automaticDimension
            default:
                return 0
            }
        }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if  mySection[indexPath.section] is [PostModel]{
            let detailPostVC = DetailPostViewController()
            detailPostVC.setupDetailPostVC(model: postModel[indexPath.row])
            present(detailPostVC, animated: true)
        } else if mySection[indexPath.section] is [PhotoModel]{
            let photoVC = PhotosViewController()
            photoVC.title = "Фото"
            navigationController?.pushViewController(photoVC, animated: true)
        }
    }
}



