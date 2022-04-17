//
//  Profile.swift
//  Navigation
//
//  Created by Георгий Маркарян on 09.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private lazy var profileHeader: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView()
        profileHeader.translatesAutoresizingMaskIntoConstraints = false
        return profileHeader
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
    }

    override func viewWillLayoutSubviews() {
        layout()
    }

    private func layout(){
        view.addSubview(profileHeader)

        profileHeader.addSubview(profileHeader.profileImageView)
        profileHeader.addSubview(profileHeader.textField)
        profileHeader.addSubview(profileHeader.tapButton)
        profileHeader.addSubview(profileHeader.newTapButton)
        profileHeader.addSubview(profileHeader.status)
        profileHeader.addSubview(profileHeader.name)

        NSLayoutConstraint.activate([
            profileHeader.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeader.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            profileHeader.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            profileHeader.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            profileHeader.heightAnchor.constraint(equalToConstant: 220)
        ])

        NSLayoutConstraint.activate([
            profileHeader.textField.heightAnchor.constraint(equalToConstant: 40),
            profileHeader.textField.bottomAnchor.constraint(equalTo: profileHeader.tapButton.topAnchor, constant: -8),
            profileHeader.textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            profileHeader.textField.leadingAnchor.constraint(equalTo: profileHeader.profileImageView.trailingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([ profileHeader.tapButton.topAnchor.constraint(equalTo: profileHeader.profileImageView.bottomAnchor, constant: 16),
            profileHeader.tapButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            profileHeader.tapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileHeader.tapButton.heightAnchor.constraint(equalToConstant: 50)

        ])

        NSLayoutConstraint.activate([            profileHeader.profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileHeader.profileImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            profileHeader.profileImageView.widthAnchor.constraint(equalToConstant: 110),
            profileHeader.profileImageView.heightAnchor.constraint(equalToConstant: 110)
         ])

        NSLayoutConstraint.activate([
            profileHeader.name.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27),
            profileHeader.name.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

        NSLayoutConstraint.activate([
            profileHeader.status.leadingAnchor.constraint(equalTo: profileHeader.textField.leadingAnchor),
            profileHeader.status.bottomAnchor.constraint(equalTo: profileHeader.textField.topAnchor, constant: -8),
        ])
        NSLayoutConstraint.activate([
            profileHeader.newTapButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeader.newTapButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeader.newTapButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
}

}


