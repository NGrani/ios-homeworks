//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Георгий Маркарян on 10.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
   private let profileVC = ProfileViewController()
   private var statusText: String? = "Waiting for something..."

    let profileImageView: UIImageView = {
        let profileImageView = UIImageView(frame: CGRect(x: 16, y: 104, width: 110, height: 110))
        profileImageView.backgroundColor = .black
        profileImageView.image = UIImage(named: "imageprofile")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.black.cgColor
        profileImageView.layer.cornerRadius = 55
        profileImageView.clipsToBounds = true
        return profileImageView
    }()

    var name: UILabel {
        let name = UILabel(frame: CGRect(x: profileVC.view.frame.midX - 25, y: 27, width: 300, height: 200))
        name.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        name.textColor = .black
        name.text = "Serius"
        return name
    }

    var status: UILabel = {
        let status = UILabel(frame: CGRect(x: 135, y: 90 , width: 300, height: 200))
        status.font = UIFont(name:"HelveticaNeue", size: 14.0)
        status.textColor = UIColor.gray
        status.adjustsFontSizeToFitWidth = true
        status.text = "Waiting for something..."
        return status
    }()



    lazy var textField: UITextField = {
        let textField = UITextField(frame: CGRect(x: status.frame.minX, y: profileImageView.frame.maxY - 3, width: 200, height: 40))
        textField.layer.cornerRadius = 12
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = UIFont(name:"HelveticaNeue", size: 15.0)
        textField.textAlignment = .center
        textField.textColor = .black
        textField.placeholder = "Введите статус"
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)

        return textField

    }()
    @objc func statusTextChanged(){
        let textField = textField.text
        statusText = textField
     }

    func tapButton(){
        let updateStatus = UIButton(frame: CGRect(
            x: 0,
            y: profileImageView.frame.maxY + 46,
            width: profileVC.view.frame.width - 32,
            height: 50))
        updateStatus.center.x = profileVC.view.center.x
        updateStatus.layer.cornerRadius = 4
        updateStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        updateStatus.layer.shadowRadius = 4
        updateStatus.layer.shadowColor = UIColor.black.cgColor
        updateStatus.layer.shadowOpacity = 0.7
        updateStatus.setTitle("Обновить статус", for: .normal)
        updateStatus.backgroundColor = .blue
        updateStatus.addTarget(self, action: #selector(pressAction), for: .touchUpInside)
        self.addSubview(updateStatus)

    }

    @objc  func pressAction(){
        if let statusText = statusText {
            status.text = statusText
                print(statusText)
        }
    }

}


