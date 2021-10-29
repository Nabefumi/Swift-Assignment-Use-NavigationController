//
//  AppRouter.swift
//  Assignment2-1
//
//  Created by Takafumi Watanabe on 2021-10-28.
//

import UIKit

class AppRouter {
    
    static func navigate(to vc: UIViewController) {
        if let SceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
            let nc = UINavigationController(rootViewController: vc)
            SceneDelegate.window?.rootViewController = nc
        }
    }
    
}
