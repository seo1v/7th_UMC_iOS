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
    let scrollView = UIScrollView()
    let contentView = UIView()

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
        imageView.image = UIImage(named: "alarm")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // 광고 이미지 뷰
    let advertisementImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "advertisement")
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
    
    // Just Dropped Section
    let justDroppedTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Just Dropped"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let justDroppedSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "발매 상품"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    let justDroppedCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5 // 간격 조정
        layout.itemSize = CGSize(width: 150, height: 240)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCell")
        return collectionView
    }()
    
    // Winter Collection Section
    let winterCollectionTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "본격 한파대비! 연말 필수템 모음"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let winterCollectionSubtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "#해피홀리룩챌린지"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .gray
        return label
    }()
    
    let winterCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 5
        layout.itemSize = CGSize(width: 150, height: 200)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(WinterCollectionViewCell.self, forCellWithReuseIdentifier: "WinterCell")
        return collectionView
    }()
    
    // Divider lines
    let justDroppedDivider = UIView()
    let winterCollectionDivider = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupScrollView()
        setupSearchView()
        setupMenuBar()
        setupLayout()
        
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
        justDroppedCollectionView.delegate = self
        justDroppedCollectionView.dataSource = self
        winterCollectionView.delegate = self
        winterCollectionView.dataSource = self
        
        toggleContentVisibility(show: selectedIndex == 0)
    }

    private func setupScrollView() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalTo(scrollView)
        }
    }

    private func setupSearchView() {
        contentView.addSubview(searchView)
        searchView.addSubview(searchLabel)
        contentView.addSubview(alarmImageView)
        
        searchView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
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
            make.left.equalTo(searchView.snp.right).offset(15)
            make.width.height.equalTo(24)
        }
    }

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
        
        contentView.addSubview(menuStackView)
        menuStackView.snp.makeConstraints { make in
            make.top.equalTo(searchView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        underlineView.backgroundColor = .black
        contentView.addSubview(underlineView)
        updateUnderlinePosition(animated: false)
    }

    private func setupLayout() {
        contentView.addSubview(advertisementImageView)
        advertisementImageView.snp.makeConstraints { make in
            make.top.equalTo(underlineView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(374)
            make.height.equalTo(336)
        }

        contentView.addSubview(menuCollectionView)
        menuCollectionView.snp.makeConstraints { make in
            make.top.equalTo(advertisementImageView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(180)
        }
        
        // Just Dropped Section Layout
        contentView.addSubview(justDroppedDivider)
        contentView.addSubview(justDroppedTitleLabel)
        contentView.addSubview(justDroppedSubtitleLabel)
        contentView.addSubview(justDroppedCollectionView)
        
        justDroppedDivider.backgroundColor = UIColor(hex: "#F2F2F2")
        justDroppedDivider.snp.makeConstraints { make in
            make.top.equalTo(menuCollectionView.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        justDroppedTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(justDroppedDivider.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(16)
        }
        
        justDroppedSubtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(justDroppedTitleLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(16)
        }
        
        justDroppedCollectionView.snp.makeConstraints { make in
            make.top.equalTo(justDroppedSubtitleLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(250)
        }
        
        // Winter Collection Section Layout
        contentView.addSubview(winterCollectionDivider)
        contentView.addSubview(winterCollectionTitleLabel)
        contentView.addSubview(winterCollectionSubtitleLabel)
        contentView.addSubview(winterCollectionView)
        
        winterCollectionDivider.backgroundColor = UIColor(hex: "#F2F2F2")
        winterCollectionDivider.snp.makeConstraints { make in
            make.top.equalTo(justDroppedCollectionView.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        
        winterCollectionTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(winterCollectionDivider.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(16)
        }
        
        winterCollectionSubtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(winterCollectionTitleLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(16)
        }
        
        winterCollectionView.snp.makeConstraints { make in
            make.top.equalTo(winterCollectionSubtitleLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(200)
            make.bottom.equalToSuperview().offset(-20) // ScrollView에서 콘텐츠 끝을 맞추기 위해 설정
        }
    }

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
        justDroppedTitleLabel.isHidden = !show
        justDroppedSubtitleLabel.isHidden = !show
        justDroppedCollectionView.isHidden = !show
        winterCollectionTitleLabel.isHidden = !show
        winterCollectionSubtitleLabel.isHidden = !show
        winterCollectionView.isHidden = !show
        justDroppedDivider.isHidden = !show
        winterCollectionDivider.isHidden = !show
    }
}

// MARK: - CollectionView Delegate and DataSource
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == justDroppedCollectionView {
            return 4
        } else if collectionView == winterCollectionView {
            return 3
        } else {
            return menuItems.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == justDroppedCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCollectionViewCell
            
            switch indexPath.item {
            case 0: cell.configure(with: UIImage(named: "matin_kim") ?? UIImage(), transactionText: "거래 12.8만", productName: "Matin Kim", description: "Logo Coating Jumper", price: "228,000원", isBookmarked: false)
            case 1:
                cell.configure(with: UIImage(named: "mlb") ?? UIImage(), transactionText: "거래 12.8만", productName: "MLB", description: "청키라이너 뉴욕양키스", price: "139,000원", isBookmarked: false)
            case 2:
                cell.configure(with: UIImage(named: "jordan") ?? UIImage(), transactionText: "거래 15.6만", productName: "Jordan", description: "Jordan 1 Retro High OG\nYellow Ochre", price: "228,000원", isBookmarked: true)
            case 3:
                cell.configure(with: UIImage(named: "humanmade") ?? UIImage(), transactionText: "거래 20.0만", productName: "Human Made", description: "Human Made x Kaws\nVarsity Jacket #1 Black", price: "2,000,000원", isBookmarked: false)
            default:
                break
            }
            
            return cell
        } else if collectionView == winterCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WinterCell", for: indexPath) as! WinterCollectionViewCell
            
            switch indexPath.item {
            case 0:
                cell.configure(with: UIImage(named: "winter1") ?? UIImage(), username: "@katarinabluu")
            case 1:
                cell.configure(with: UIImage(named: "winter2") ?? UIImage(), username: "@imwinter")
            case 2:
                cell.configure(with: UIImage(named: "winter3") ?? UIImage(), username: "@thousand_woo")
            default:
                break
            }
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: indexPath) as! MenuCollectionViewCell
            let (title, imageName) = menuItems[indexPath.item]
            cell.configure(with: title, imageName: imageName)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == justDroppedCollectionView && indexPath.item == 0 {
            let detailVC = MatinKimDetailViewController()
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == justDroppedCollectionView {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        } else if collectionView == winterCollectionView {
            return UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        }
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == justDroppedCollectionView || collectionView == winterCollectionView {
            return 5
        }
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
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
