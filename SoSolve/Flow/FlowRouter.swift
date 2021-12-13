//
//  FlowRouter.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import Foundation
import Swinject
import UIKit

final class FlowRouter {
    let resolver: Resolver
    var navigationController: UINavigationController!
    weak var window: UIWindow?

    init(resolver: Resolver, window: UIWindow?) {
        self.resolver = resolver
        self.window = window
        observeNavigation()
    }

    private func observeNavigation() {
        var navigationService = resolver.resolve(NavigationService.self)

        navigationService?.showCallback = {
            [weak self]
            navigationScene in

            switch navigationScene {
            case let .detailView(gallery):
                self?.presentDetails(gallery: gallery)
            }
        }

        navigationService?.customCallback = {
            [weak self]
            customAction in

            switch customAction {
            case let .dismissCurrentScreen(animated):
                self?.navigationController.popViewController(animated: animated)
            }
        }
    }

    func launch() {
        let navigationController = UINavigationController()
        self.navigationController = navigationController
        window?.rootViewController = navigationController
        let listViewController = ListViewControllerFactory.make(resolver: resolver)
        navigationController.viewControllers = [listViewController]
    }

    private func presentDetails(gallery: Gallery) {
        let detailsViewController = GalleryDetailsViewControllerFactory.make(resolver: resolver, gallery: gallery)
        navigationController.pushViewController(detailsViewController, animated: true)
    }
}
