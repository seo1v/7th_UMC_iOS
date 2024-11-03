//
//  NavigationViewController.swift
//  UMC-iOS-Workbook-Week2
//
//  Created by 엄민서 on 10/2/24.
//

import UIKit

import SnapKit

class NavigationViewController: UIViewController {
    private let label = UILabel()
    private let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "버튼을 누르면 모달 방식의 화면 전환이 일어나요"
        label.textColor = .cyan
        
        button.setTitle("버튼을 눌러주세요", for: .normal)
        button.backgroundColor = .systemTeal
        
        view.addSubview(label)
        view.addSubview(button)
        
        label.snp.makeConstraints {
            $0.top.equalToSuperview().offset(200)
            $0.centerX.equalToSuperview()
        }
        
        button.snp.makeConstraints {
            $0.top.equalToSuperview().offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(55)
            $0.width.equalTo(255)
        }
        
        button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func buttonDidTap() {
        let viewController = UIViewController()
        
        viewController.view.backgroundColor = .lightGray
        
        navigationController?.pushViewController(viewController, animated: true)
    }
}
