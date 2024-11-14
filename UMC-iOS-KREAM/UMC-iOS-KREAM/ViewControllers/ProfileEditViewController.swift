//
//  ProfileEditViewController.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 10/2/24.
//

import UIKit

class ProfileEditViewController: UIViewController {

    private let profileEditView = ProfileEditView() 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        view.addSubview(profileEditView)  
        setupLayout()
        setupNavigation()
        setupActions()  
    }
    
    private func setupLayout() {
        profileEditView.snp.makeConstraints { make in
            make.edges.equalToSuperview()  
        }
    }
    
    private func setupNavigation() {
        self.title = "프로필 관리"
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "arrow")?.withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.adjustsImageWhenHighlighted = false
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    private func setupActions() {
        profileEditView.emailChangeButton.addTarget(self, action: #selector(handleEmailChange), for: .touchUpInside)
        profileEditView.passwordChangeButton.addTarget(self, action: #selector(handlePasswordChange), for: .touchUpInside)
    }
    
    @objc private func handleEmailChange() {
        profileEditView.emailTextField.isEnabled = true
        profileEditView.emailTextField.placeholder = "새로운 이메일을 입력해주세요!"
        profileEditView.emailChangeButton.setTitle("확인", for: .normal)
    }
    
    @objc private func handlePasswordChange() {
        profileEditView.passwordTextField.isEnabled = true
        profileEditView.passwordTextField.placeholder = "새로운 비밀번호를 입력해주세요!"
        profileEditView.passwordChangeButton.setTitle("확인", for: .normal)
    }
    
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
