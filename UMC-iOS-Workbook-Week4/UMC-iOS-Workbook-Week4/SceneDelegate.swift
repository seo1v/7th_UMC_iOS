//
//  SceneDelegate.swift
//  UMC-iOS-Workbook-Week4
//
//  Created by 엄민서 on 10/30/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = TeenipingViewController()
        self.window?.makeKeyAndVisible()
    }

}

