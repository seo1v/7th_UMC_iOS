//
//  MainTabBarController.swift
//  UMC-iOS-KREAM
//
//  Created by 엄민서 on 10/2/24.
//

//import UIKit
//
//class MainTabBarController: UITabBarController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // 각 ViewController 생성
//        let homeVC = HomeViewController()
//        let styleVC = StyleViewController()
//        let shopVC = ShopViewController()
//        let savedVC = SavedViewController()
//        let myVC = MyViewController()
//
//        // 탭바 이미지 설정
//        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: resizeImage(named: "Home"), tag: 0)
//        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: resizeImage(named: "Style"), tag: 1)
//        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: resizeImage(named: "Shop"), tag: 2)
//        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: resizeImage(named: "Saved"), tag: 3)
//        myVC.tabBarItem = UITabBarItem(title: "MY", image: resizeImage(named: "My"), tag: 4)
//        
//        // 탭바에 ViewController들 설정
//        viewControllers = [homeVC, styleVC, shopVC, savedVC, myVC]
//    }
//    
//    // 이미지 크기 조정 함수
//    private func resizeImage(named: String) -> UIImage? {
//        guard let image = UIImage(named: named) else { return nil }
//        let newSize = CGSize(width: 30, height: 30)  // 가로 30, 세로 30 크기로 맞춤
//        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
//        image.draw(in: CGRect(origin: .zero, size: newSize))
//        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return resizedImage
//    }
//}

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 각 ViewController 생성
        let homeVC = HomeViewController()
        let styleVC = StyleViewController()
        let shopVC = ShopViewController()
        let savedVC = SavedViewController()
        let myVC = MyViewController()
        let myNavVC = UINavigationController(rootViewController: myVC)  // MyViewController를 UINavigationController로 감쌈

        // 탭바 이미지 설정
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: resizeImage(named: "Home"), tag: 0)
        styleVC.tabBarItem = UITabBarItem(title: "STYLE", image: resizeImage(named: "Style"), tag: 1)
        shopVC.tabBarItem = UITabBarItem(title: "SHOP", image: resizeImage(named: "Shop"), tag: 2)
        savedVC.tabBarItem = UITabBarItem(title: "SAVED", image: resizeImage(named: "Saved"), tag: 3)
        myNavVC.tabBarItem = UITabBarItem(title: "MY", image: resizeImage(named: "My"), tag: 4)  // myNavVC에 탭바 아이템 설정
        
        // 탭바에 ViewController들 설정
        viewControllers = [homeVC, styleVC, shopVC, savedVC, myNavVC]  // MyViewController가 아닌 myNavVC 추가
    }
    
    // 이미지 크기 조정 함수
    private func resizeImage(named: String) -> UIImage? {
        guard let image = UIImage(named: named) else { return nil }
        let newSize = CGSize(width: 30, height: 30)  // 가로 30, 세로 30 크기로 맞춤
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        image.draw(in: CGRect(origin: .zero, size: newSize))
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizedImage
    }
}
