//
//  HomeViewController.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 10/30/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    // Segmented Control
    let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"])
        control.selectedSegmentIndex = 0
        control.addTarget(self, action: #selector(segmentedControlChanged), for: .valueChanged)
        return control
    }()

    // 광고 이미지 뷰
    let advertisementImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "advertisement_image") // Export한 이미지를 Assets에 추가해야 합니다.
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // CollectionView for 메뉴 리스트
    let homeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 80, height: 80)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "MenuCell")
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupLayout()
        
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }

    @objc func segmentedControlChanged() {
        // SegmentedControl의 선택에 따라 화면 업데이트 (추후 구현)
    }
    
    private func setupLayout() {
        // Segmented Control 레이아웃
        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.right.equalToSuperview().inset(16)
        }

        // 광고 이미지 레이아웃
        view.addSubview(advertisementImageView)
        advertisementImageView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(150)
        }

        // CollectionView 레이아웃
        view.addSubview(menuCollectionView)
        menuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(advertisementImageView.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(100)
        }
    }
}

// MARK: - CollectionView Delegate and DataSource
extension MainViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // 메뉴 아이템 개수
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCollectionViewCell
        // cell 구성 (예: cell.setTitle("크림 드로우") )
        return cell
    }
}
