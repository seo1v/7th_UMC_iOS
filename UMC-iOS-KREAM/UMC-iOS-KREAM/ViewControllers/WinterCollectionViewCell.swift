//
//  WinterCollectionViewCell.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 11/7/24.
//

import UIKit
import SnapKit

class WinterCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    let usernameLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 이미지 뷰 설정
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        contentView.addSubview(imageView)
        
        // 사용자 이름 라벨 설정 (배경 없음, 하얀색 텍스트)
        usernameLabel.font = UIFont.systemFont(ofSize: 14)
        usernameLabel.textColor = .white
        usernameLabel.textAlignment = .left
        contentView.addSubview(usernameLabel)

        // Auto Layout 설정
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.left.equalToSuperview().offset(10)
        }
    }
    
    func configure(with image: UIImage, username: String) {
        imageView.image = image
        usernameLabel.text = username
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
