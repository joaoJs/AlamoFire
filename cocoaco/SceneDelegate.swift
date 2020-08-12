//
//  SceneDelegate.swift
//  Practice2
//
//  Created by Joao Campos on 8/4/20.
//  Copyright © 2020 Joao Campos. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.windowScene = sceneWindow
        
        let navC = UINavigationController()
        let vc = MainViewController()
        navC.pushViewController(vc, animated: false)
        
        self.window?.rootViewController = navC
        self.window?.makeKeyAndVisible()
    }


}

