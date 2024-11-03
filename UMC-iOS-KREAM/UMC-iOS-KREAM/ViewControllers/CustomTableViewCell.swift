//
//  CustomTableViewCell.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 10/9/24.
//
//
//import UIKit
//
//class CustomTableViewCell: UITableViewCell {
//
//    let drinkImageView = UIImageView()
//    let titleLabel = UILabel()
//    let descriptionLabel = UILabel()
//    let priceLabel = UILabel()
//    let bookmarkButton = UIButton()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        // Image view setup
//        drinkImageView.translatesAutoresizingMaskIntoConstraints = false
//        drinkImageView.layer.cornerRadius = 8
//        drinkImageView.clipsToBounds = true
//        drinkImageView.image = UIImage(named: "yourImageName") // Replace with your image name
//        contentView.addSubview(drinkImageView)
//
//        // Title label setup
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.text = "하얀 음료"
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
//        contentView.addSubview(titleLabel)
//
//        // Description label setup
//        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
//        descriptionLabel.text = "이 음료를 마시면 건강해져요\n근데 어디가 건강해질까요? 한 번 마셔봐....."
//        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
//        descriptionLabel.numberOfLines = 2
//        descriptionLabel.textColor = .gray
//        contentView.addSubview(descriptionLabel)
//
//        // Price label setup
//        priceLabel.translatesAutoresizingMaskIntoConstraints = false
//        priceLabel.text = "120,000원"
//        priceLabel.font = UIFont.boldSystemFont(ofSize: 18)
//        contentView.addSubview(priceLabel)
//
//        // Bookmark button setup
//        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
//        bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
//        contentView.addSubview(bookmarkButton)
//
//        // Layout constraints
//        NSLayoutConstraint.activate([
//            drinkImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
//            drinkImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            drinkImageView.widthAnchor.constraint(equalToConstant: 80),
//            drinkImageView.heightAnchor.constraint(equalToConstant: 80),
//
//            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
//            titleLabel.leadingAnchor.constraint(equalTo: drinkImageView.trailingAnchor, constant: 16),
//            
//            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
//            descriptionLabel.leadingAnchor.constraint(equalTo: drinkImageView.trailingAnchor, constant: 16),
//            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            
//            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
//            
//            bookmarkButton.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
//            bookmarkButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
//        ])
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func configure(with title: String, description: String, price: String) {
//        titleLabel.text = title
//        descriptionLabel.text = description
//        priceLabel.text = price
//    }
//}

import UIKit

class CustomTableViewCell: UITableViewCell {

    let drinkImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let priceLabel = UILabel()
    let bookmarkButton = UIButton()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 이미지뷰 설정
        drinkImageView.translatesAutoresizingMaskIntoConstraints = false
        drinkImageView.layer.cornerRadius = 8
        drinkImageView.clipsToBounds = true
        drinkImageView.image = UIImage(named: "yourImageName") // 이미지 이름을 적절히 수정하세요
        contentView.addSubview(drinkImageView)

        // 타이틀 라벨 설정
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        contentView.addSubview(titleLabel)

        // 설명 라벨 설정
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.numberOfLines = 2
        descriptionLabel.textColor = .gray
        contentView.addSubview(descriptionLabel)

        // 가격 라벨 설정
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        contentView.addSubview(priceLabel)

        // 북마크 버튼 설정
        bookmarkButton.translatesAutoresizingMaskIntoConstraints = false
        bookmarkButton.setImage(UIImage(systemName: "bookmark.fill"), for: .normal)
        contentView.addSubview(bookmarkButton)

        // 제약 조건 설정
        NSLayoutConstraint.activate([
            // 이미지뷰 제약 조건
            drinkImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            drinkImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            drinkImageView.widthAnchor.constraint(equalToConstant: 80),
            drinkImageView.heightAnchor.constraint(equalToConstant: 80),

            // 타이틀 라벨 제약 조건
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: drinkImageView.trailingAnchor, constant: 16),

            // 설명 라벨 제약 조건
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: drinkImageView.trailingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            // 가격 라벨 제약 조건
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            priceLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            // 북마크 버튼 제약 조건
            bookmarkButton.trailingAnchor.constraint(equalTo: priceLabel.trailingAnchor),
            bookmarkButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),

            // 셀 하단과 마지막 요소 간의 간격을 설정
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with title: String, description: String, price: String) {
        titleLabel.text = title
        descriptionLabel.text = description
        priceLabel.text = price
    }
}
