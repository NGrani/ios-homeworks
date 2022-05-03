//
//  LogInViewController.swift
//  Navigation
//
//  Created by Георгий Маркарян on 17.04.2022.
//

import UIKit

class LogInViewController: UIViewController {

    private let nc = NotificationCenter.default

    private let defaultLogin = "serius@mail.ru"
    private let defaultPassword = "Qwerty123"

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
        setupGestures()
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
            scrollView.horizontalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
    @objc private func keyboardHide(){
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
        scrollView.horizontalScrollIndicatorInsets = .zero
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

    private func setupGestures() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(tapDismiss))
        tapScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(tapScreen)

    }
    @objc private func tapDismiss(){
        view.endEditing(true)
    }

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
        login.textAlignment = .left
        login.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: login.frame.height))
        login.leftViewMode = .always
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
        password.textAlignment = .left
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.leftViewMode = .always
        password.font = .systemFont(ofSize: 16)
        password.autocapitalizationType = .none
        password.delegate = self
        password.isSecureTextEntry = true
        password.placeholder = "Password"
        return password
    }()

    var warningPasswordLabel: UILabel = {
        let warningPasswordLabel = UILabel()
        warningPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        warningPasswordLabel.font = UIFont(name:"HelveticaNeue", size: 12)
        warningPasswordLabel.textColor = .red
        warningPasswordLabel.adjustsFontSizeToFitWidth = true
        warningPasswordLabel.alpha = 0
        warningPasswordLabel.text = "Пароль должен содержать минимум 8 символов"
        return warningPasswordLabel
    }()

    var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.layer.cornerRadius = 10
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = UIColor("#4885CC")
        loginButton.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        return loginButton
    }()

    @objc private func loginAction(){
        let profileVC = ProfileViewController()
        UIView.animate(withDuration: 0.1,
                       animations: {
            self.loginButton.alpha = 0.5
        }) { (completed) in
            UIView.animate(withDuration: 0.5,
                           animations: {
                self.loginButton.alpha = 1
            })
        }
                guard  !login.isEmpty && !password.isEmpty else{
                    if login.isEmpty{
                        textFieldAnimate(_: login)
                    }
                    if password.isEmpty{
                        textFieldAnimate(_: password)
                    }
                    return
                }
                guard password.text!.count > 7 else {
                    textFieldAnimate(_: password)
                    warningAnimate()
                    return
                }
                guard isValidEmail(testStr: login.text!) else {
                    return alertEmailAction()
                }

                guard  login.text == defaultLogin else{
                    alertPasswordAction()
                    return
                }
                guard  password.text == defaultPassword else{
                    alertPasswordAction()
                    return
                }

        navigationController?.pushViewController(profileVC, animated: true)
    }

    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }

    private func textFieldAnimate(_ textField: UITextField){
        UITextField.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
            textField.backgroundColor = .white
            textField.backgroundColor = .systemGray6
        }
    }
    private func warningAnimate(){
        UILabel.animate(withDuration: 0.1, delay: 0, options: .curveEaseIn) {
            self.warningPasswordLabel.alpha = 0
        }
        UILabel.animate(withDuration: 0.8, delay: 0, options: .curveEaseIn) {
            self.warningPasswordLabel.alpha = 1
        }
    }

    private func alertPasswordAction(){
        let alert = UIAlertController(title: "Ошибка авторизации", message: "Проверьте правильность написания данных", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Хорошо", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }

    private func alertEmailAction(){
        let alert = UIAlertController(title: "Ошибка авторизации", message: "Некоректный E-mail", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Хорошо", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }

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

        [login, password].forEach {stackView.addArrangedSubview($0)}
        [logo, loginButton,warningPasswordLabel, stackView].forEach {contentView.addSubview($0)}

        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
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
            warningPasswordLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 4),
            warningPasswordLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            warningPasswordLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            warningPasswordLabel.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -14)
        ])

        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -50)
        ])
    }


}


// MARK: - UITextFieldDelegate

extension LogInViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard login.isFirstResponder else {
            return view.endEditing(true)
        }
        password.becomeFirstResponder()
        return true
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
// MARK: - UITextField

extension UITextField {
    var isEmpty: Bool {
        return text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
    }
}
