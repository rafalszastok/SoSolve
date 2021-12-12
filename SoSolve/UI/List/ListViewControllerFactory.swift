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
        let viewModel = ListViewModel(resolver: resolver)
        let viewController = ListViewController()
        viewController.inject(viewModel: viewModel)
        return viewController
    }
}
