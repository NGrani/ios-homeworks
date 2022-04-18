//
//  LogInViewController.swift
//  Navigation
//
//  Created by Георгий Маркарян on 17.04.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private let nc = NotificationCenter.default

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .white
        return $0
    }(UIView())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        layout()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
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
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    @objc private func keyboardHide(){
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.backgroundColor = .lightGray
        stackView.distribution = .fillEqually
        stackView.spacing = 0.5
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor

        return stackView
    }()

    var logo: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "logo")
        return logo
    }()

    private lazy  var login: UITextField = {
        let login = UITextField()
        login.translatesAutoresizingMaskIntoConstraints = false
        login.backgroundColor = .systemGray6
        login.textColor = .black
        login.textAlignment = .center
        login.font = .systemFont(ofSize: 16)
        login.autocapitalizationType = .none
        login.delegate = self
        login.placeholder = "Email or phone"
        return login
    }()

    private lazy var password: UITextField = {
        let password = UITextField()
        password.translatesAutoresizingMaskIntoConstraints = false
        password.backgroundColor = .systemGray6
        password.textColor = .black
        password.textAlignment = .center
        password.font = .systemFont(ofSize: 16)
        password.autocapitalizationType = .none
        password.delegate = self
        password.isSecureTextEntry = true
        password.placeholder = "Password"
        return password
    }()

    var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.layer.cornerRadius = 10
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = UIColor("#4885CC")
        return loginButton
    }()

    func layout(){
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])

        scrollView.addSubview(contentView)

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])

        [logo, loginButton].forEach {view.addSubview($0)}
        view.addSubview(stackView)
        [login, password].forEach {stackView.addArrangedSubview($0)}


        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logo.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logo.heightAnchor.constraint(equalToConstant: 100),
            logo.widthAnchor.constraint(equalToConstant: 100)
        ])

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }


}


// MARK: - UITextFieldDelegate
extension LogInViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

// MARK: - HexToUIColor
extension UIColor {

  convenience init(_ hex: String, alpha: CGFloat = 1.0) {
    var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if cString.hasPrefix("#") { cString.removeFirst() }

    if cString.count != 6 {
      self.init("ff0000") // return red color for wrong hex input
      return
    }

    var rgbValue: UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)

    self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
              green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
              blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
              alpha: alpha)
  }

}
