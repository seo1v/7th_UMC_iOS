//
//  MyViewController.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 10/2/24.
//

//import UIKit
//import SnapKit
//
//class MyViewController: UIViewController {
//    
//    let profileImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.layer.cornerRadius = 40  // 프로필 이미지 크기 조정
//        imageView.layer.masksToBounds = true
//        imageView.contentMode = .scaleAspectFill
//        imageView.image = UIImage(named: "profileImage")
//        return imageView
//    }()
//    
//    let usernameLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Jeong_iOS"
//        label.font = UIFont.systemFont(ofSize: 16)
//        return label
//    }()
//    
//    let followerLabel: UILabel = {
//        let label = UILabel()
//        let boldText = NSMutableAttributedString(string: "팔로워 ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
//        let boldNumber = NSMutableAttributedString(string: "326", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)])
//        boldText.append(boldNumber)
//        label.attributedText = boldText
//        return label
//    }()
//    
//    let followingLabel: UILabel = {
//        let label = UILabel()
//        let boldText = NSMutableAttributedString(string: "팔로잉 ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
//        let boldNumber = NSMutableAttributedString(string: "20", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)])
//        boldText.append(boldNumber)
//        label.attributedText = boldText
//        return label
//    }()
//    
//    let manageProfileButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("프로필 관리", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.layer.borderColor = UIColor.lightGray.cgColor
//        button.layer.borderWidth = 1
//        button.layer.cornerRadius = 10
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
//        return button
//    }()
//    
//    let shareProfileButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("프로필 공유", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.layer.borderColor = UIColor.lightGray.cgColor
//        button.layer.borderWidth = 1
//        button.layer.cornerRadius = 10
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
//        return button
//    }()
//    
//    let settingButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "Setting"), for: .normal)
//        return button
//    }()
//    
//    let cameraButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "Camera"), for: .normal)
//        return button
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        setupLayout()
//    }
//    
//    func setupLayout() {
//        view.addSubview(profileImageView)
//        view.addSubview(usernameLabel)
//        view.addSubview(followerLabel)
//        view.addSubview(followingLabel)
//        view.addSubview(manageProfileButton)
//        view.addSubview(shareProfileButton)
//        view.addSubview(settingButton)
//        view.addSubview(cameraButton)
//        
//        // 상단의 설정 버튼
//        settingButton.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
//            make.leading.equalToSuperview().offset(20)
//            make.width.height.equalTo(30)
//        }
//        
//        // 상단의 카메라 버튼
//        cameraButton.snp.makeConstraints { make in
//            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
//            make.trailing.equalToSuperview().offset(-20)
//            make.width.height.equalTo(30)
//        }
//        
//        // 프로필 이미지, 이름, 팔로워/팔로잉 레이아웃
//        profileImageView.snp.makeConstraints { make in
//            make.top.equalTo(settingButton.snp.bottom).offset(50)
//            make.leading.equalToSuperview().offset(20)
//            make.width.height.equalTo(80)
//        }
//        
//        usernameLabel.snp.makeConstraints { make in
//            make.top.equalTo(profileImageView.snp.top)
//            make.leading.equalTo(profileImageView.snp.trailing).offset(20)
//        }
//        
//        followerLabel.snp.makeConstraints { make in
//            make.top.equalTo(usernameLabel.snp.bottom).offset(5)
//            make.leading.equalTo(profileImageView.snp.trailing).offset(20)
//        }
//        
//        followingLabel.snp.makeConstraints { make in
//            make.top.equalTo(followerLabel.snp.top)
//            make.leading.equalTo(followerLabel.snp.trailing).offset(20)
//        }
//        
//        manageProfileButton.snp.makeConstraints { make in
//            make.top.equalTo(profileImageView.snp.bottom).offset(20)
//            make.leading.equalToSuperview().offset(40)
//            make.width.equalTo(157)
//            make.height.equalTo(26)
//        }
//        
//        shareProfileButton.snp.makeConstraints { make in
//            make.top.equalTo(profileImageView.snp.bottom).offset(20)
//            make.leading.equalTo(manageProfileButton.snp.trailing).offset(20)
//            make.width.equalTo(157)
//            make.height.equalTo(26)
//        }
//    }
//}

import UIKit
import SnapKit

class MyViewController: UIViewController {
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 40  // 프로필 이미지 크기 조정
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "profileImage")
        return imageView
    }()
    
    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "Jeong_iOS"
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    let followerLabel: UILabel = {
        let label = UILabel()
        let boldText = NSMutableAttributedString(string: "팔로워 ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        let boldNumber = NSMutableAttributedString(string: "326", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)])
        boldText.append(boldNumber)
        label.attributedText = boldText
        return label
    }()
    
    let followingLabel: UILabel = {
        let label = UILabel()
        let boldText = NSMutableAttributedString(string: "팔로잉 ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12)])
        let boldNumber = NSMutableAttributedString(string: "20", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 12)])
        boldText.append(boldNumber)
        label.attributedText = boldText
        return label
    }()
    
    let manageProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 관리", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    let shareProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("프로필 공유", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        return button
    }()
    
    let settingButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Setting"), for: .normal)
        return button
    }()
    
    let cameraButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Camera"), for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupActions()  // 추가된 부분: 액션 설정
    }
    
    func setupLayout() {
        view.addSubview(profileImageView)
        view.addSubview(usernameLabel)
        view.addSubview(followerLabel)
        view.addSubview(followingLabel)
        view.addSubview(manageProfileButton)
        view.addSubview(shareProfileButton)
        view.addSubview(settingButton)
        view.addSubview(cameraButton)
        
        // 상단의 설정 버튼
        settingButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(30)
        }
        
        // 상단의 카메라 버튼
        cameraButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.trailing.equalToSuperview().offset(-20)
            make.width.height.equalTo(30)
        }
        
        // 프로필 이미지, 이름, 팔로워/팔로잉 레이아웃
        profileImageView.snp.makeConstraints { make in
            make.top.equalTo(settingButton.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.width.height.equalTo(80)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.top)
            make.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }
        
        followerLabel.snp.makeConstraints { make in
            make.top.equalTo(usernameLabel.snp.bottom).offset(5)
            make.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }
        
        followingLabel.snp.makeConstraints { make in
            make.top.equalTo(followerLabel.snp.top)
            make.leading.equalTo(followerLabel.snp.trailing).offset(20)
        }
        
        manageProfileButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(40)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
        
        shareProfileButton.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.leading.equalTo(manageProfileButton.snp.trailing).offset(20)
            make.width.equalTo(157)
            make.height.equalTo(26)
        }
    }
    
    func setupActions() {
        manageProfileButton.addTarget(self, action: #selector(goToProfileEdit), for: .touchUpInside)
        }
        
        // ProfileEditViewController로 이동
        @objc func goToProfileEdit() {
            let profileEditVC = ProfileEditViewController()
            navigationController?.pushViewController(profileEditVC, animated: true)
        }
}
