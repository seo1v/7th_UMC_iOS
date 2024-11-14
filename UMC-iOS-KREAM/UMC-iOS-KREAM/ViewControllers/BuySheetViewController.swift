//
//  BuySheetViewController.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 11/14/24.
//

import UIKit
import SnapKit

class BuySheetViewController: UIViewController {
    
    // 닫기 버튼
    let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("X", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // 타이틀 라벨
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "구매하기"
        label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    // 가격 단위 라벨
    let unitLabel: UILabel = {
        let label = UILabel()
        label.text = "(가격 단위: 원)"
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = .gray
        label.textAlignment = .center
        return label
    }()
    
    // 상품 이미지
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "matin_kim")
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    // 상품명 라벨
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Matin Kim Logo Coating Jumper"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    // 상품 설명 라벨
    let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "마뗑킴 로고 코팅 점퍼 블랙"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(hex: "#9C9C9C")
        return label
    }()
    
    private var selectedSizeButton: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupSizeButtons()
        setupBottomButtons()
    }
    
    private func setupLayout() {
        view.addSubview(closeButton)
        view.addSubview(titleLabel)
        view.addSubview(unitLabel)
        view.addSubview(productImageView)
        view.addSubview(productNameLabel)
        view.addSubview(productDescriptionLabel)
        
        closeButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.right.equalToSuperview().inset(10)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.centerX.equalToSuperview()
        }
        
        unitLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
        }
        
        productImageView.snp.makeConstraints { make in
            make.top.equalTo(unitLabel.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(16)
            make.width.height.equalTo(91)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.top)
            make.left.equalTo(productImageView.snp.right).offset(16)
        }
        
        productDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(4)
            make.left.equalTo(productImageView.snp.right).offset(16)
        }
    }
    
    private func setupSizeButtons() {
        let sizes = ["S", "M", "L", "XL", "XXL"]
        let prices = ["360,000", "360,000", "360,000", "360,000", "360,000"]
        
        let sizeStackView1 = UIStackView()
        sizeStackView1.axis = .horizontal
        sizeStackView1.spacing = 15
        sizeStackView1.distribution = .equalSpacing
        
        let sizeStackView2 = UIStackView()
        sizeStackView2.axis = .horizontal
        sizeStackView2.spacing = 15
        sizeStackView2.distribution = .fillEqually
        
        for (index, size) in sizes.enumerated() {
            let button = UIButton(type: .system)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 10
            button.layer.borderColor = UIColor(hex: "#F2F2F2").cgColor
            button.addTarget(self, action: #selector(sizeButtonTapped(_:)), for: .touchUpInside)
            button.tag = index  // Tag를 이용하여 버튼 구분
            
            // 버튼 내부 StackView로 사이즈와 가격 라벨 배치
            let innerStackView = UIStackView()
            innerStackView.axis = .vertical
            innerStackView.alignment = .center
            innerStackView.spacing = 4
            
            let sizeLabel = UILabel()
            sizeLabel.text = size
            sizeLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            sizeLabel.textColor = .black
            
            let priceLabel = UILabel()
            priceLabel.text = prices[index]
            priceLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
            priceLabel.textColor = UIColor(hex: "#D95A5D")
            
            innerStackView.addArrangedSubview(sizeLabel)
            innerStackView.addArrangedSubview(priceLabel)
            
            button.addSubview(innerStackView)
            innerStackView.snp.makeConstraints { make in
                make.center.equalToSuperview()
            }
            
            button.snp.makeConstraints { make in
                make.width.equalTo(110)
                make.height.equalTo(47)
            }
            
            if index < 3 {
                sizeStackView1.addArrangedSubview(button)
            } else {
                sizeStackView2.addArrangedSubview(button)
            }

        }
        
        view.addSubview(sizeStackView1)
        view.addSubview(sizeStackView2)
        
        sizeStackView1.snp.makeConstraints { make in
            make.top.equalTo(productImageView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(16)
            make.width.equalTo(110)
            make.height.equalTo(47)
        }
        
        sizeStackView2.snp.makeConstraints { make in
            make.top.equalTo(sizeStackView1.snp.bottom).offset(10)
            make.left.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(141)
            make.width.equalTo(110)
            make.height.equalTo(47)
        }
    }
    
    private func setupBottomButtons() {
        let fastDeliveryButton = UIButton(type: .system)
        fastDeliveryButton.backgroundColor = UIColor(hex: "#EF6254")
        fastDeliveryButton.layer.cornerRadius = 10
        fastDeliveryButton.titleLabel?.numberOfLines = 2
        fastDeliveryButton.titleLabel?.textAlignment = .center
        
        let fastPriceText = NSMutableAttributedString(string: "345,000\n", attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .semibold),
            .foregroundColor: UIColor.white
        ])
        let fastDeliveryText = NSAttributedString(string: "빠른배송(1-2일 소요)", attributes: [
            .font: UIFont.systemFont(ofSize: 10, weight: .regular),
            .foregroundColor: UIColor(hex: "#FFCAB9")
        ])
        fastPriceText.append(fastDeliveryText)
        fastDeliveryButton.setAttributedTitle(fastPriceText, for: .normal)
        
        let regularDeliveryButton = UIButton(type: .system)
        regularDeliveryButton.backgroundColor = UIColor(hex: "#222222")
        regularDeliveryButton.layer.cornerRadius = 10
        regularDeliveryButton.titleLabel?.numberOfLines = 2
        regularDeliveryButton.titleLabel?.textAlignment = .center
        
        let regularPriceText = NSMutableAttributedString(string: "407,000\n", attributes: [
            .font: UIFont.systemFont(ofSize: 14, weight: .semibold),
            .foregroundColor: UIColor.white
        ])
        let regularDeliveryText = NSAttributedString(string: "일반배송(5-7일 소요)", attributes: [
            .font: UIFont.systemFont(ofSize: 10, weight: .regular),
            .foregroundColor: UIColor(hex: "#E2E2E2")
        ])
        regularPriceText.append(regularDeliveryText)
        regularDeliveryButton.setAttributedTitle(regularPriceText, for: .normal)
        
        view.addSubview(fastDeliveryButton)
        view.addSubview(regularDeliveryButton)
        
        fastDeliveryButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(168)
            make.height.equalTo(52)
        }
        
        regularDeliveryButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.width.equalTo(168)
            make.height.equalTo(52)
        }
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func sizeButtonTapped(_ sender: UIButton) {
        selectedSizeButton?.layer.borderColor = UIColor(hex: "#F2F2F2").cgColor
        selectedSizeButton?.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        sender.layer.borderColor = UIColor.black.cgColor
        sender.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        
        selectedSizeButton = sender
    }
}

extension UIColor {
    convenience init(hex: String) {
        var hexFormatted: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexFormatted.hasPrefix("#") {
            hexFormatted.remove(at: hexFormatted.startIndex)
        }
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}
