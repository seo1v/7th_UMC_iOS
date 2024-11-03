//
//  HomeViewController.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 10/2/24.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {

    // 메뉴 버튼 배열
    let menuTitles = ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
    var menuButtons: [UIButton] = []
    var underlineView = UIView()
    var selectedIndex = 0

    // 검색 창
    let searchView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F5F5F5")
        view.layer.cornerRadius = 12
        return view
    }()
    
    let searchLabel: UILabel = {
        let label = UILabel()
        label.text = "브랜드, 상품, 프로필, 태그 등"
        label.font = UIFont.systemFont(ofSize: 13.5)
        label.textColor = UIColor(hex: "#B6B6B6")
        return label
    }()

    // 알람 이미지 뷰
    let alarmImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "alarm") // 이미지를 직접 로드
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // 광고 이미지 뷰
    let advertisementImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "advertisement") // Export한 이미지를 Assets에 추가해야 합니다.
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // CollectionView for 메뉴 리스트
    let menuCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 61, height: 81)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "MenuCell")
        return collectionView
    }()

    // 메뉴 데이터
    let menuItems = [
        ("크림 드로우", "img1"), ("실시간 차트", "img2"), ("남성 추천", "img3"),
        ("여성 추천", "img4"), ("색다른 추천", "img5"), ("정가 아래", "img6"),
        ("운세 24AW", "img7"), ("올해의 베스트", "img8"), ("10월의 베네핏", "img9"),
        ("아크네 선물", "img10")
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupSearchView()
        setupMenuBar()
        setupLayout()
        
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        
        // 초기 추천 탭에 광고 및 메뉴 리스트만 표시
        toggleContentVisibility(show: selectedIndex == 0)
    }

    // 검색 창 및 알람 이미지 설정
    private func setupSearchView() {
        view.addSubview(searchView)
        searchView.addSubview(searchLabel)
        view.addSubview(alarmImageView)
        
        searchView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            make.left.equalToSuperview().inset(16)
            make.width.equalTo(303)
            make.height.equalTo(40)
        }
        
        searchLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(10)
        }
        
        alarmImageView.snp.makeConstraints { make in
            make.centerY.equalTo(searchView)
            make.left.equalTo(searchView.snp.right).offset(15) // 오른쪽으로 약간 더 이동
            make.width.height.equalTo(24)
        }
    }
    
    // 메뉴 바 설정
    private func setupMenuBar() {
        let menuStackView = UIStackView()
        menuStackView.axis = .horizontal
        menuStackView.distribution = .equalSpacing
        
        for (index, title) in menuTitles.enumerated() {
            let button = UIButton(type: .system)
            button.setTitle(title, for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            button.addTarget(self, action: #selector(menuButtonTapped(_:)), for: .touchUpInside)
            button.tag = index
            menuStackView.addArrangedSubview(button)
            menuButtons.append(button)
        }
        
        view.addSubview(menuStackView)
        menuStackView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        // 밑줄 설정
        underlineView.backgroundColor = .black
        view.addSubview(underlineView)
        updateUnderlinePosition(animated: false)
    }

    // 밑줄 위치 업데이트 함수
    private func updateUnderlinePosition(animated: Bool) {
        let selectedButton = menuButtons[selectedIndex]
        underlineView.snp.remakeConstraints { make in
            make.height.equalTo(2)
            make.bottom.equalTo(selectedButton.snp.bottom).offset(5)
            make.width.equalTo(selectedButton)
            make.centerX.equalTo(selectedButton)
        }
        
        UIView.animate(withDuration: animated ? 0.3 : 0) {
            self.view.layoutIfNeeded()
        }
        
        for (index, button) in menuButtons.enumerated() {
            button.titleLabel?.font = index == selectedIndex ? UIFont.boldSystemFont(ofSize: 16) : UIFont.systemFont(ofSize: 16)
        }
    }

    @objc func menuButtonTapped(_ sender: UIButton) {
        selectedIndex = sender.tag
        updateUnderlinePosition(animated: true)
        
        // 추천 탭에서만 광고와 메뉴 리스트 표시
        toggleContentVisibility(show: selectedIndex == 0)
    }
    
    private func toggleContentVisibility(show: Bool) {
        advertisementImageView.isHidden = !show
        menuCollectionView.isHidden = !show
    }
    
    private func setupLayout() {
        // 광고 이미지 레이아웃
        view.addSubview(advertisementImageView)
        advertisementImageView.snp.makeConstraints { make in
            make.top.equalTo(underlineView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(374)
            make.height.equalTo(336)
        }

        // CollectionView 레이아웃
        view.addSubview(menuCollectionView)
        menuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(advertisementImageView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(180) // 두 줄로 표시할 높이
        }
    }
}

// MARK: - CollectionView Delegate and DataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCollectionViewCell
        let (title, imageName) = menuItems[indexPath.item]
        cell.configure(with: title, imageName: imageName)
        return cell
    }
}

// UIColor 확장 (Hex 색상 지원)
extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}


