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
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let idTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "예) kream@kream.co.kr"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let pwdLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pwdTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18,weight: .medium)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        button.translatesAutoresizingMaskIntoConstraints = false
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
    }
    
    private func setupAutoLayout() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 287),
            logoImageView.heightAnchor.constraint(equalToConstant: 75),
            
            idLabel.topAnchor.constraint(equalTo: topAnchor, constant: 250),
            idLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            idLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            idTextField.topAnchor.constraint(equalTo: idLabel.bottomAnchor, constant: 20),
            idTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            idTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            idTextField.heightAnchor.constraint(equalToConstant: 40),
            
            pwdLabel.topAnchor.constraint(equalTo: idTextField.bottomAnchor, constant: 20),
            pwdLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            pwdLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            pwdTextField.topAnchor.constraint(equalTo: pwdLabel.bottomAnchor, constant: 20),
            pwdTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            pwdTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            pwdTextField.heightAnchor.constraint(equalToConstant: 40),
            
            loginButton.topAnchor.constraint(equalTo: pwdTextField.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
