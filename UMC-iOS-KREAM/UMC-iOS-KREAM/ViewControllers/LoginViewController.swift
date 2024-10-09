//
//  ViewController.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 9/25/24.
//

//import UIKit
//
//class LoginViewController: UIViewController {
//    
//    // View를 LoginView로 설정
//    let loginView = LoginView()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // View 설정
//        view.backgroundColor = .white
//        view.addSubview(loginView)
//        
//        setupAutoLayout()
//    }
//    
//    // LoginView의 오토레이아웃 설정
//    private func setupAutoLayout() {
//        loginView.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            loginView.topAnchor.constraint(equalTo: view.topAnchor),
//            loginView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//    }
//}

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    // View를 LoginView로 설정
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // View 설정
        view.backgroundColor = .white
        view.addSubview(loginView)
        
        // SnapKit을 사용하여 AutoLayout 설정
        setupAutoLayout()
        
        // 로그인 버튼에 액션 추가
        loginView.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    // LoginView의 오토레이아웃 설정 (SnapKit 사용)
    private func setupAutoLayout() {
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()  // 부모 뷰의 모든 엣지에 맞춤
        }
    }
    
    @objc private func handleLogin() {
        let mainTabBarController = MainTabBarController()  //MainTabBarController로 전환
        mainTabBarController.modalPresentationStyle = .fullScreen  // 전체 화면으로 모달 전환
            present(mainTabBarController, animated: true, completion: nil)
    }
}
