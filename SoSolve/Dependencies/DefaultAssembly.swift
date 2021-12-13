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
        container.register(GalleryFetcherService.self, factory: {
            _ in
            ConcreteGalleryFetcherService()
        })

        container.register(NavigationService.self, factory: {
            _ in
            ConcreteNavigationService()
        })

        container.register(GalleryPersistenceService.self, factory: {
            resolver in
            let galleryFetcherService = resolver.resolve(GalleryFetcherService.self)!
            return ConcreteGalleryPersistenceService(galleryFetcherService: galleryFetcherService)
        })
    }
}
