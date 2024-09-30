//
//  ViewController.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 9/25/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // View를 LoginView로 설정
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View 설정
        view.backgroundColor = .white
        view.addSubview(loginView)
        
        setupAutoLayout()
    }
    
    // LoginView의 오토레이아웃 설정
    private func setupAutoLayout() {
        loginView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.topAnchor),
            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

