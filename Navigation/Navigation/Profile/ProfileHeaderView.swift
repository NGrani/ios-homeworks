//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Георгий Маркарян on 10.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    private lazy var profileVC: ProfileViewController = {
        let profileVC = ProfileViewController()
        return profileVC
    }()
   
   private var statusText: String? = "Waiting for something..."

    let profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.backgroundColor = .black
        profileImageView.image = UIImage(named: "imageprofile")
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.layer.borderWidth = 3
        profileImageView.layer.borderColor = UIColor.black.cgColor
        profileImageView.layer.cornerRadius = 55
        profileImageView.clipsToBounds = true
        return profileImageView
    }()

      var name: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        name.textColor = .black
        name.text = "Serius"
        return name
    }()

    var status: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.font = UIFont(name:"HelveticaNeue", size: 14.0)
        status.textColor = .gray
        status.adjustsFontSizeToFitWidth = true
        status.text = "Waiting for something..."
        return status
    }()



    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
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

    var tapButton: UIButton = {
        let updateStatus = UIButton()
        updateStatus.translatesAutoresizingMaskIntoConstraints = false
        updateStatus.layer.cornerRadius = 4
        updateStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        updateStatus.layer.shadowRadius = 4
        updateStatus.layer.shadowColor = UIColor.black.cgColor
        updateStatus.layer.shadowOpacity = 0.7
        updateStatus.setTitle("Обновить статус", for: .normal)
        updateStatus.backgroundColor = .blue
        updateStatus.addTarget(self, action: #selector(pressAction), for: .touchUpInside)
      return updateStatus
    }()

    @objc  func pressAction(){
        if let statusText = statusText {
            status.text = statusText
                print(statusText)
        }
    }

// Пункт 3 "Добавьте новую UIButton, изменить title.."
    var newTapButton: UIButton = {
        let updateStatus = UIButton()
        updateStatus.translatesAutoresizingMaskIntoConstraints = false
        updateStatus.layer.cornerRadius = 4
        updateStatus.layer.shadowOffset = CGSize(width: 4, height: 4)
        updateStatus.layer.shadowRadius = 4
        updateStatus.layer.shadowColor = UIColor.black.cgColor
        updateStatus.layer.shadowOpacity = 0.7
        updateStatus.setTitle("Кнопка", for: .normal)
        updateStatus.backgroundColor = .blue
        updateStatus.addTarget(self, action: #selector(doAction), for: .touchUpInside)
      return updateStatus
    }()

    @objc  func doAction(){
        newTapButton.setTitle("Ты нажал кнопку", for: .normal)
        }
    }




