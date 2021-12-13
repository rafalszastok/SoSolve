//
//  ListViewControllerFactory.swift
//  SoSolve
//
//  Created by Rafal Szastok on 12/12/2021.
//

import Foundation
import Swinject

final class ListViewControllerFactory {
    static func make(resolver: Resolver) -> ListViewController {
        let viewModel = ListViewModel(
            galleryPersistenceService: resolver.resolve(GalleryPersistenceService.self)!,
            navigationService: resolver.resolve(NavigationService.self)!
        )
        let viewController = ListViewController()
        viewController.inject(viewModel: viewModel)
        viewModel.delegate = viewController
        return viewController
    }
}
