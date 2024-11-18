//
//  LoginView.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 9/25/24.
//

import UIKit

class LoginView: UIView {
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let idLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일 주소"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "예) kream@kream.co.kr"
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.setLeftPaddingPoints(16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let pwdLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pwdTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.layer.cornerRadius = 15
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.isSecureTextEntry = true
        textField.font = UIFont.systemFont(ofSize: 12)
        textField.setLeftPaddingPoints(16)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let kakaoLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("카카오로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.setImage(UIImage(named: "kakao"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentHorizontalAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.imageView!.widthAnchor.constraint(equalToConstant: 20),
            button.imageView!.heightAnchor.constraint(equalToConstant: 20),
            button.imageView!.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            button.imageView!.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10)
        ])
        return button
    }()
    
    let appleLoginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Apple로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.setImage(UIImage(named: "apple"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentHorizontalAlignment = .center
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button.imageView!.widthAnchor.constraint(equalToConstant: 20),
            button.imageView!.heightAnchor.constraint(equalToConstant: 20),
            button.imageView!.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            button.imageView!.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 10)
        ])
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(logoImageView)
        addSubview(idLabel)
        addSubview(idTextField)
        addSubview(pwdLabel)
        addSubview(pwdTextField)
        addSubview(loginButton)
        addSubview(kakaoLoginButton)
        addSubview(appleLoginButton)
    }
    
    private func setupAutoLayout() {
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: screenHeight * 0.14),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: screenWidth * 0.73),
            logoImageView.heightAnchor.constraint(equalToConstant: screenHeight * 0.09),
            
            idLabel.topAnchor.constraint(equalTo: topAnchor, constant: screenHeight * 0.3),
            idLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * 0.09),
            
            idTextField.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: screenHeight * 0.02),
            idTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            idTextField.widthAnchor.constraint(equalToConstant: screenWidth * 0.77),
            idTextField.heightAnchor.constraint(equalToConstant: screenHeight * 0.04),
            
            pwdLabel.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: screenHeight * 0.02),
            pwdLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth * 0.09),
            
            pwdTextField.topAnchor.constraint(equalTo: pwdLabel.bottomAnchor, constant: screenHeight * 0.02),
            pwdTextField.centerXAnchor.constraint(equalTo: centerXAnchor),
            pwdTextField.widthAnchor.constraint(equalToConstant: screenWidth * 0.77),
            pwdTextField.heightAnchor.constraint(equalToConstant: screenHeight * 0.04),
            
            loginButton.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor, constant: screenHeight * 0.03),
            loginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: screenWidth * 0.77),
            loginButton.heightAnchor.constraint(equalToConstant: screenHeight * 0.045),
            
            kakaoLoginButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: screenHeight * 0.1),
            kakaoLoginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            kakaoLoginButton.widthAnchor.constraint(equalToConstant: screenWidth * 0.76),
            kakaoLoginButton.heightAnchor.constraint(equalToConstant: screenHeight * 0.047),
            
            appleLoginButton.topAnchor.constraint(equalTo: kakaoLoginButton.bottomAnchor, constant: screenHeight * 0.023),
            appleLoginButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            appleLoginButton.widthAnchor.constraint(equalToConstant: screenWidth * 0.76),
            appleLoginButton.heightAnchor.constraint(equalToConstant: screenHeight * 0.047)
        ])
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}
