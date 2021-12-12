//
//  SceneDelegate.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import UIKit

@available(iOS 13.0, *)
final class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var flowRouter: FlowRouter?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        let window = UIWindow(windowScene: windowScene)

        window.rootViewController = ListViewController()
        let assembler = AssemblerFactory.make()
        flowRouter = FlowRouter(resolver: assembler.resolver, window: window)
        flowRouter?.launch()
        self.window = window
        window.makeKeyAndVisible()
        self.window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_: UIScene) {
        // Called as the scene is being released by the system.
    }

    func sceneDidBecomeActive(_: UIScene) {
        // Not called under iOS 12 - See AppDelegate applicationDidBecomeActive
    }

    func sceneWillResignActive(_: UIScene) {
        // Not called under iOS 12 - See AppDelegate applicationWillResignActive
    }

    func sceneWillEnterForeground(_: UIScene) {
        // Not called under iOS 12 - See AppDelegate applicationWillEnterForeground
    }

    func sceneDidEnterBackground(_: UIScene) {
        // Not called under iOS 12 - See AppDelegate applicationDidEnterBackground
    }
}
