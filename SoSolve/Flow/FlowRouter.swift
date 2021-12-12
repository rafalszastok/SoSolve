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
    weak var window: UIWindow?

    init(resolver: Resolver, window: UIWindow?) {
        self.resolver = resolver
        self.window = window
    }

    func launch() {
        window?.rootViewController = ListViewControllerFactory.make(resolver: resolver)
    }
}
