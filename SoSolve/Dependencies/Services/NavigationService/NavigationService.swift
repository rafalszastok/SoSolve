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

protocol NavigationService {
    func selected(gallery: Gallery)
    typealias ShowCallback = (NavigationScene) -> Void
    var showCallback: ShowCallback? { get set }
}

final class ConcreteNavigationService: NavigationService {
    var showCallback: ShowCallback?

    func selected(gallery: Gallery) {
        showCallback?(.detailView(gallery: gallery))
    }
}
