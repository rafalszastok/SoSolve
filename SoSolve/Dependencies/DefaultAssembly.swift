//
//  DefaultAssembly.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import Foundation
import Swinject

final class DefaultAssembly: Assembly {
    func assemble(container: Container) {

        container.register(GalleryContentService.self, factory: {
            _ in
            return ConcreteGalleryContentService()
        })
    }
}
