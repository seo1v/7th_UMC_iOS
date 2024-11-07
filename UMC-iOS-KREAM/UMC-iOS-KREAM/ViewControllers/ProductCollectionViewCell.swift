//
//  ProductCollectionViewCell.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 11/7/24.
//

import UIKit
import SnapKit

class ProductCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    let transactionLabel = UILabel() // 오른쪽 상단 거래 가격 라벨
    let bookmarkIcon = UIImageView()
    let productNameLabel = UILabel()
    let descriptionLabel = UILabel()
    let priceLabel = UILabel()
    let buyNowLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 이미지 뷰 설정
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        contentView.addSubview(imageView)
        
        // 거래 가격 라벨 설정 (오른쪽 상단)
        transactionLabel.font = UIFont.systemFont(ofSize: 10, weight: .light)
        transactionLabel.textColor = .black
        contentView.addSubview(transactionLabel)
        
        // 북마크 아이콘 설정 (오른쪽 하단)
        bookmarkIcon.tintColor = .black
        contentView.addSubview(bookmarkIcon)
        
        // 상품명 라벨 설정
        productNameLabel.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        productNameLabel.textColor = .black
        contentView.addSubview(productNameLabel)
        
        // 설명 라벨 설정
        descriptionLabel.font = UIFont.systemFont(ofSize: 12, weight: .light)
        descriptionLabel.textColor = .gray
        contentView.addSubview(descriptionLabel)
        
        // 가격 라벨 설정
        priceLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        priceLabel.textColor = .black
        contentView.addSubview(priceLabel)
        
        // 즉시 구매가 라벨 설정
        buyNowLabel.text = "즉시 구매가"
        buyNowLabel.font = UIFont.systemFont(ofSize: 10, weight: .light)
        buyNowLabel.textColor = .black
        contentView.addSubview(buyNowLabel)
        
        // Auto Layout 설정
        imageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.centerX.equalToSuperview() // 중심에 배치
            make.width.height.equalTo(142) // 142x142 크기 설정
        }
        
        transactionLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView).offset(5)
            make.right.equalTo(imageView).offset(-5)
        }
        
        bookmarkIcon.snp.makeConstraints { make in
            make.bottom.equalTo(imageView).offset(-5)
            make.right.equalTo(imageView).offset(-5)
            make.width.height.equalTo(20)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(8)
            make.left.equalToSuperview().offset(10)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(2)
            make.left.equalTo(productNameLabel)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(10) // 설명과 가격 사이의 간격 조정
            make.left.equalToSuperview().offset(10)
        }
        
        buyNowLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(3) // 가격과 즉시 구매가 사이 간격 조정
            make.left.equalTo(priceLabel)
            make.bottom.equalToSuperview().offset(-1) // 여유 공간 추가
        }
    }
    
    func configure(with image: UIImage, transactionText: String, productName: String, description: String, price: String, isBookmarked: Bool) {
        imageView.image = image
        transactionLabel.text = transactionText
        productNameLabel.text = productName
        descriptionLabel.text = description
        priceLabel.text = price
        bookmarkIcon.image = UIImage(systemName: isBookmarked ? "bookmark.fill" : "bookmark") // 북마크 상태에 따라 아이콘 설정
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
