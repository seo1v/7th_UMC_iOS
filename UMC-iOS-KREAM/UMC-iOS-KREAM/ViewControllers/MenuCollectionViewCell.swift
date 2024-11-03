//
//  MenuCollectionViewCell.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 10/30/24.
//

import UIKit
import SnapKit

class MenuCollectionViewCell: UICollectionViewCell {
    // 메뉴 아이템의 이미지
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30.5 // 동그랗게 만들기 위해 이미지 크기의 절반
        imageView.clipsToBounds = true
        return imageView
    }()
    
    // 메뉴 아이템의 제목
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11.5) // 폰트 크기 11.5px
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 2 // 두 줄까지 표시 가능
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        
        // 레이아웃 설정
        imageView.snp.makeConstraints { make in
            make.top.centerX.equalToSuperview()
            make.width.height.equalTo(61) // 이미지 크기 61x61
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(5)
            make.centerX.equalToSuperview()
            make.width.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 셀 설정 함수
    func configure(with title: String, imageName: String) {
        titleLabel.text = title
        imageView.image = UIImage(named: imageName) // 이미지 로드
    }
}
