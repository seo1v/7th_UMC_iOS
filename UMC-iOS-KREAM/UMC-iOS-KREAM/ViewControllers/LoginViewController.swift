//
//  ViewController.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 9/25/24.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    var coordinator: LoginCoordinator?  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(loginView)
        setupAutoLayout()
        
        loginView.loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    private func setupAutoLayout() {
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc private func handleLogin() {
        coordinator?.navigateToMainTabBar() 
    }
}

class LoginCoordinator {
    weak var viewController: UIViewController?
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    func navigateToMainTabBar() {
        let mainTabBarController = MainTabBarController()
        mainTabBarController.modalPresentationStyle = .fullScreen
        viewController?.present(mainTabBarController, animated: true, completion: nil)
    }
}
