//
//  SceneDelegate.swift
//  DDTTest
//
//  Created by Denny Arfansyah on 11/01/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
    
        window = UIWindow(windowScene: scene)
        window?.rootViewController = Coordinator.start()
        window?.makeKeyAndVisible()
    }
}
