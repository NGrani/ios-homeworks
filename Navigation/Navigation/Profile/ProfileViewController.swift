//
//  Profile.swift
//  Navigation
//
//  Created by Георгий Маркарян on 09.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    private lazy var profileHeader: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        profileHeader.addSubview(profileHeader.profileImageView)
        profileHeader.addSubview(profileHeader.name)
        profileHeader.addSubview(profileHeader.textField)
        profileHeader.addSubview(profileHeader.status)
        profileHeader.tapButton()
        
        return profileHeader
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        view.addSubview(profileHeader)
    }
}
