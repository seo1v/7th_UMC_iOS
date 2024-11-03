//
//  TeenipingViewController.swift
//  UMC-iOS-Workbook-Week4
//
//  Created by 엄민서 on 10/30/24.
//

import UIKit

import SnapKit
import Then

class TeenipingViewController: UIViewController {
    private let rootView = TeenipingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupAction()
        setupDelegate()

    }
    private func setupAction() {
        rootView.segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlValueChanged(segment:)),
            for: .valueChanged
        )
    }
    
    private func setupDelegate() {
        rootView.teenipingCollectionView.dataSource = self
    }

    @objc
    private func segmentedControlValueChanged(segment: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            rootView.teenipingCollectionView.isHidden = false
            rootView.emptyLabel.isHidden = ture
        }
        else {
            rootView.teenipingCollectionView.isHidden = true
            rootView.emptyLabel.isHidden = false
        }
    }
}
extension TeenipingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TeenipingModel.dummy().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: TeenipingCollectionViewCell.identifier,
                    for: indexPath
        ) as? TeenipingCollectionViewCell else {
                    return UICollectionViewCell()
        }
        let list = TeenipingModel.dummy()
                
        cell.imageView.image = list[indexPath.row].image
        cell.titleLabel.text = list[indexPath.row].name
    
        return cell
    }
}
