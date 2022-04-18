//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Георгий Маркарян on 10.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {

  
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
        textField.delegate = self
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
            textField.text = ""
                print(statusText)
        }
    }


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

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc  func doAction(){
        newTapButton.setTitle("Ты нажал кнопку", for: .normal)
        }

    private func layout(){
            addSubview(profileImageView)
            addSubview(textField)
            addSubview(tapButton)
            addSubview(newTapButton)
            addSubview(status)
            addSubview(name)

            NSLayoutConstraint.activate([
                textField.heightAnchor.constraint(equalToConstant: 40),
                textField.bottomAnchor.constraint(equalTo: tapButton.topAnchor, constant: -8),
                textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
                textField.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 16)
            ])

            NSLayoutConstraint.activate([
               tapButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16),
               tapButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
               tapButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
               tapButton.heightAnchor.constraint(equalToConstant: 50),
//               tapButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
            ])

            NSLayoutConstraint.activate([
                profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
                profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
                profileImageView.widthAnchor.constraint(equalToConstant: 110),
                profileImageView.heightAnchor.constraint(equalToConstant: 110)
             ])

            NSLayoutConstraint.activate([
                name.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
                name.centerXAnchor.constraint(equalTo: centerXAnchor)
            ])

            NSLayoutConstraint.activate([
                status.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
                status.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -8),
            ])
            NSLayoutConstraint.activate([
                newTapButton.topAnchor.constraint(equalTo: tapButton.bottomAnchor, constant: 12),
                newTapButton.leadingAnchor.constraint(equalTo: leadingAnchor),
                newTapButton.trailingAnchor.constraint(equalTo: trailingAnchor),
                newTapButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
            ])
    }

}
// MARK: - UITextFieldDelegate
extension ProfileHeaderView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        pressAction()
        textField.text = ""
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
            endEditing(true)
    }
}


