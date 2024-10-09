//
//  ProfileEditViewController.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 10/2/24.
//

import UIKit
import SnapKit

class ProfileEditViewController: UIViewController {

    // UI 요소들
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "profileImage")
        return imageView
    }()
    
    let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "example@naver.com"
        textField.borderStyle = .roundedRect
        textField.isEnabled = false  // 초기에는 비활성화
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "****************"
        textField.borderStyle = .roundedRect
        textField.isEnabled = false  // 초기에는 비활성화
        return textField
    }()
    
    let emailChangeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("변경", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    let passwordChangeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("변경", for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 5
        return button
    }()
    
    let profileInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "프로필 정보"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupNavigation()
        setupActions()
    }
    
    // 네비게이션 설정
    func setupNavigation() {
        self.title = "프로필 관리"
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "arrow")?.withRenderingMode(.alwaysOriginal), for: .normal)
        backButton.adjustsImageWhenHighlighted = false  // 하이라이트 방지
        backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
        
    }
    
    // 레이아웃 설정
    func setupLayout() {
        view.addSubview(profileImageView)
        view.addSubview(profileInfoLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(emailChangeButton)
        view.addSubview(passwordChangeButton)
        
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(80)
        }
        
        profileInfoLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(30)
            make.leading.equalToSuperview().offset(20)
        }
        
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(profileInfoLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(emailChangeButton.snp.leading).offset(-10)
            make.height.equalTo(40)
        }
        
        emailChangeButton.snp.makeConstraints { make in
            make.centerY.equalTo(emailTextField)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalTo(passwordChangeButton.snp.leading).offset(-10)
            make.height.equalTo(40)
        }
        
        passwordChangeButton.snp.makeConstraints { make in
            make.centerY.equalTo(passwordTextField)
            make.trailing.equalToSuperview().offset(-20)
            make.width.equalTo(60)
            make.height.equalTo(40)
        }
    }
    
    // 액션 설정
    func setupActions() {
        emailChangeButton.addTarget(self, action: #selector(handleEmailChange), for: .touchUpInside)
        passwordChangeButton.addTarget(self, action: #selector(handlePasswordChange), for: .touchUpInside)
    }
    
    // 이메일 변경 버튼 클릭 시 동작
    @objc func handleEmailChange() {
        emailTextField.isEnabled = true
        emailTextField.placeholder = "새로운 이메일을 입력해주세요!"
        emailChangeButton.setTitle("확인", for: .normal)
    }
    
    // 비밀번호 변경 버튼 클릭 시 동작
    @objc func handlePasswordChange() {
        passwordTextField.isEnabled = true
        passwordTextField.placeholder = "새로운 비밀번호를 입력해주세요!"
        passwordChangeButton.setTitle("확인", for: .normal)
    }
    
    // 뒤로가기 버튼 액션
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
}
