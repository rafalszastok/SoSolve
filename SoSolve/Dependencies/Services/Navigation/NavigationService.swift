//
//  NavigationService.swift
//  SoSolve
//
//  Created by Rafal Szastok on 12/12/2021.
//

import Foundation

enum NavigationScene {
    case detailView(gallery: Gallery)
}

enum NavigationCustomAction {
    case dismissCurrentScreen(animated: Bool)
}

protocol NavigationService {
    typealias ShowCallback = (NavigationScene) -> Void
    typealias CustomActionCallback = (NavigationCustomAction) -> Void

    func selected(gallery: Gallery)
    func dismissCurrentScreen(animated: Bool)

    var showCallback: ShowCallback? { get set }
    var customCallback: CustomActionCallback? { get set }
}

final class ConcreteNavigationService: NavigationService {
    var showCallback: ShowCallback?
    var customCallback: CustomActionCallback?

    func selected(gallery: Gallery) {
        showCallback?(.detailView(gallery: gallery))
    }

    func dismissCurrentScreen(animated: Bool) {
        customCallback?(NavigationCustomAction.dismissCurrentScreen(animated: animated))
    }
}
