//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Георгий Маркарян on 10.04.2022.
//

import UIKit

class ProfileHeaderView: UIView {


    private var statusText: String? = "Waiting for something..."

    private var leadingProfileImageView = NSLayoutConstraint()
    private var topProfileImageView = NSLayoutConstraint()
    private var widthProfileImageView = NSLayoutConstraint()
    private var heightProfileImageView = NSLayoutConstraint()

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

    private let viewUnderImage: UIView = {
        let viewUnderImage = UIView()
        let profileVC = ProfileViewController()
        viewUnderImage.translatesAutoresizingMaskIntoConstraints = false
        viewUnderImage.backgroundColor = .black
        viewUnderImage.alpha = 0.0
        viewUnderImage.frame = profileVC.view.frame
        return viewUnderImage
    }()

    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        profileImageView.isUserInteractionEnabled = true
        profileImageView.addGestureRecognizer(tapGesture)
    }

    private var closeProfileImageButton: UIButton = {
        let closeProfileImageButton = UIButton()
        closeProfileImageButton.translatesAutoresizingMaskIntoConstraints = false
        closeProfileImageButton.setImage(UIImage(systemName: "multiply"), for: UIControl.State.normal)
        closeProfileImageButton.contentMode = .scaleAspectFill
        closeProfileImageButton.alpha = 0.0
        closeProfileImageButton.addTarget(self, action: #selector(closeAction), for: .touchUpInside)
        return closeProfileImageButton
    }()

    private var name: UILabel = {
        let name = UILabel()
        name.translatesAutoresizingMaskIntoConstraints = false
        name.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        name.textColor = .black
        name.text = "Serius"
        return name
    }()

    private var status: UILabel = {
        let status = UILabel()
        status.translatesAutoresizingMaskIntoConstraints = false
        status.font = UIFont(name:"HelveticaNeue", size: 14.0)
        status.textColor = .gray
        status.adjustsFontSizeToFitWidth = true
        status.text = "Waiting for something..."
        return status
    }()

    private lazy var textField: UITextField = {
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

    private var tapButton: UIButton = {
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

    private var newTapButton: UIButton = {
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
        setupGestures()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func tapAction() {
        UIImageView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) {
            self.leadingProfileImageView.constant = 0
            self.topProfileImageView.constant = (UIScreen.main.bounds.height - UIScreen.main.bounds.width) / 3
            self.widthProfileImageView.constant = UIScreen.main.bounds.width
            self.heightProfileImageView.constant = self.widthProfileImageView.constant
            self.viewUnderImage.alpha = 0.8
            self.profileImageView.layer.cornerRadius = 0
            self.layoutIfNeeded()
        } completion: { _ in
            UIImageView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn){
                self.closeProfileImageButton.alpha = 1
            }
        }
    }

    @objc private func closeAction(){
        UIImageView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn){
            self.closeProfileImageButton.alpha = 0.0
        } completion: { _ in
            UIImageView.animate(withDuration: 0.5, delay: 0, options: .curveEaseIn) { [self] in
                leadingProfileImageView.constant = 16
                topProfileImageView.constant  = 16
                widthProfileImageView.constant  = 110
                heightProfileImageView.constant  = 110
                viewUnderImage.alpha = 0.0
                profileImageView.layer.cornerRadius = 55
                layoutIfNeeded()
            }
        }
    }

    @objc private func statusTextChanged(){
        let textField = textField.text
        statusText = textField
    }

    @objc private func pressAction(){
        if let statusText = statusText {
            status.text = statusText
            textField.text = ""
            print(statusText)
        }
    }

    @objc private func doAction(){
        newTapButton.setTitle("Ты нажал кнопку", for: .normal)
    }

    private func layout(){
        addSubview(textField)
        addSubview(tapButton)
        addSubview(newTapButton)
        addSubview(status)
        addSubview(name)
        addSubview(viewUnderImage)
        addSubview(profileImageView)
        addSubview(closeProfileImageButton)

        NSLayoutConstraint.activate([
            closeProfileImageButton.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            closeProfileImageButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])

        NSLayoutConstraint.activate([
            name.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            name.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])


        NSLayoutConstraint.activate([
            status.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20),
            status.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            status.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -8),
        ])

        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 40),
            textField.bottomAnchor.constraint(equalTo: tapButton.topAnchor, constant: -8),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            textField.leadingAnchor.constraint(equalTo: name.leadingAnchor, constant: -30)
        ])

        NSLayoutConstraint.activate([
            tapButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            tapButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tapButton.heightAnchor.constraint(equalToConstant: 50),
        ])

        NSLayoutConstraint.activate([
            newTapButton.topAnchor.constraint(equalTo: tapButton.bottomAnchor, constant: 12),
            newTapButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            newTapButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            newTapButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])

        leadingProfileImageView = profileImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        topProfileImageView = profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16)
        widthProfileImageView = profileImageView.widthAnchor.constraint(equalToConstant: 110)
        heightProfileImageView = profileImageView.heightAnchor.constraint(equalToConstant: 110)

        NSLayoutConstraint.activate([
            leadingProfileImageView,
            topProfileImageView,
            heightProfileImageView,
            widthProfileImageView
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


