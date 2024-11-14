//
//  MatinKimDetailViewController.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 11/14/24.
//

import UIKit
import SnapKit

class MatinKimDetailViewController: UIViewController {
    
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "matin_kim")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let productImageBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#F5F5F5")
        return view
    }()
    
    let colorOptionsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.itemSize = CGSize(width: 50, height: 50)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "ColorCell")
        return collectionView
    }()
    
    let purchaseNowLabel: UILabel = {
        let label = UILabel()
        label.text = "즉시 구매가"
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "228,000원"
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Matin Kim Logo Coating Jumper"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        return label
    }()
    
    let productDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "마뗑킴 로고 코팅 점퍼 블랙"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(hex: "#9C9C9C")
        return label
    }()
    
    let bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Saved"), for: .normal)
        button.tintColor = .black
        return button
    }()
    
    let bookmarkCountLabel: UILabel = {
        let label = UILabel()
        label.text = "2,122"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    let buyButton: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 10
        return view
    }()
    
    let buyLabel: UILabel = {
        let label = UILabel()
        label.text = "구매"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let buyPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "345,000원"
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let buyNowLabel: UILabel = {
        let label = UILabel()
        label.text = "즉시 판매가"
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(hex: "#A33723")
        return label
    }()
    
    let sellButton: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.layer.cornerRadius = 10
        return view
    }()
    
    let sellLabel: UILabel = {
        let label = UILabel()
        label.text = "판매"
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let sellPriceLabel: UILabel = {
        let label = UILabel()
        label.text = "396,000원"
        label.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let sellNowLabel: UILabel = {
        let label = UILabel()
        label.text = "즉시 판매가"
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        label.textColor = UIColor(hex: "#1F7745")
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupCollectionView()
        setupLayout()
        addBuyButtonGesture()
    }
    
    private func setupCollectionView() {
        colorOptionsCollectionView.delegate = self
        colorOptionsCollectionView.dataSource = self
    }
    
    private func addBuyButtonGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(buyButtonTapped))
        buyButton.addGestureRecognizer(tapGesture)
    }
    
    private func setupLayout() {
        view.addSubview(productImageBackgroundView)
        productImageBackgroundView.addSubview(productImageView)
        
        view.addSubview(colorOptionsCollectionView)
        view.addSubview(purchaseNowLabel)
        view.addSubview(priceLabel)
        view.addSubview(productNameLabel)
        view.addSubview(productDescriptionLabel)
        
        view.addSubview(bookmarkButton)
        view.addSubview(bookmarkCountLabel)
        
        view.addSubview(buyButton)
        buyButton.addSubview(buyLabel)
        buyButton.addSubview(buyPriceLabel)
        buyButton.addSubview(buyNowLabel)
        
        view.addSubview(sellButton)
        sellButton.addSubview(sellLabel)
        sellButton.addSubview(sellPriceLabel)
        sellButton.addSubview(sellNowLabel)
        
        // Layout Constraints
        productImageBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.left.right.equalToSuperview()
            make.height.equalTo(300)
        }
        
        productImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(200)
        }
        
        colorOptionsCollectionView.snp.makeConstraints { make in
            make.top.equalTo(productImageBackgroundView.snp.bottom).offset(16)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }
        
        purchaseNowLabel.snp.makeConstraints { make in
            make.top.equalTo(colorOptionsCollectionView.snp.bottom).offset(16)
            make.left.equalToSuperview().inset(16)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(purchaseNowLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().inset(16)
        }
        
        productNameLabel.snp.makeConstraints { make in
            make.top.equalTo(priceLabel.snp.bottom).offset(24)
            make.left.equalToSuperview().inset(16)
        }
        
        productDescriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(productNameLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().inset(16)
        }
        
        bookmarkButton.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-50)
            make.width.height.equalTo(24)
        }
        
        bookmarkCountLabel.snp.makeConstraints { make in
            make.top.equalTo(bookmarkButton.snp.bottom).offset(10)
            make.centerX.equalTo(bookmarkButton)
        }
        
        buyButton.snp.makeConstraints { make in
            make.left.equalTo(bookmarkCountLabel.snp.right).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.width.equalTo(147)
            make.height.equalTo(49)
        }
        
        buyLabel.snp.makeConstraints { make in
            make.left.equalTo(buyButton).offset(16)
            make.centerY.equalTo(buyButton)
        }
        
        buyPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(buyButton).offset(60)
            make.bottom.equalTo(buyButton.snp.bottom).offset(-25)
        }
        
        buyNowLabel.snp.makeConstraints { make in
            make.left.equalTo(buyButton).offset(60)
            make.top.equalTo(buyPriceLabel.snp.bottom).offset(2)
        }
        
        sellButton.snp.makeConstraints { make in
            make.left.equalTo(buyButton.snp.right).offset(16)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-30)
            make.width.equalTo(147)
            make.height.equalTo(49)
        }
        
        sellLabel.snp.makeConstraints { make in
            make.left.equalTo(sellButton).offset(16)
            make.centerY.equalTo(sellButton)
        }
        
        sellPriceLabel.snp.makeConstraints { make in
            make.left.equalTo(sellButton).offset(60)
            make.bottom.equalTo(sellButton.snp.bottom).offset(-25)
        }
        
        sellNowLabel.snp.makeConstraints { make in
            make.left.equalTo(sellButton).offset(60)
            make.top.equalTo(sellPriceLabel.snp.bottom).offset(2)
        }
    }
    
    @objc private func buyButtonTapped() {
        let buyVC = BuySheetViewController()
        buyVC.modalPresentationStyle = .pageSheet
        present(buyVC, animated: true, completion: nil)
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension MatinKimDetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorCell", for: indexPath)
        cell.backgroundColor = .clear
        
        let imageView = UIImageView(image: UIImage(named: "matin\(indexPath.item + 1)"))
        imageView.contentMode = .scaleAspectFit
        cell.contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        return cell
    }
}
