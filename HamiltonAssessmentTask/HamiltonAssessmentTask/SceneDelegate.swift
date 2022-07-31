//
//  SceneDelegate.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            let initialViewController = CurrencySelectionRouter.createCurrencySelectionModule()
            let navigationViewController = UINavigationController(rootViewController: initialViewController)
            window.rootViewController = navigationViewController
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

