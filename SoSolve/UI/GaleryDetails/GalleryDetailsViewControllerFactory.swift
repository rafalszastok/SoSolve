//
//  GalleryDetailsViewControllerFactory.swift
//  SoSolve
//
//  Created by Rafal Szastok on 12/12/2021.
//

import Foundation
import Swinject

final class GalleryDetailsViewControllerFactory {
    static func make(resolver: Resolver, gallery: Gallery) -> GalleryDetailsViewController {
        let viewModel = GalleryDetailsViewModel(resolver: resolver, gallery: gallery)
        let viewController = GalleryDetailsViewController()
        viewController.inject(viewModel: viewModel)
        viewModel.delegate = viewController
        return viewController
    }
}
