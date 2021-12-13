//
//  GalleryPersistenceService.swift
//  SoSolve
//
//  Created by Rafal Szastok on 12/12/2021.
//

import Foundation

protocol GalleryPersistenceService {
    func visibleGalleries() async -> [Gallery]
    func remove(gallery: Gallery)
}

final class ConcreteGalleryPersistenceService: GalleryPersistenceService {
    private var currentGalleries: [Gallery]?
    private let galleryFetcherService: GalleryFetcherService

    init(galleryFetcherService: GalleryFetcherService) {
        self.galleryFetcherService = galleryFetcherService
    }

    func visibleGalleries() async -> [Gallery] {
        if let currentGalleries = currentGalleries {
            return currentGalleries
        }

        let downloadedGalleries = await galleryFetcherService.fetchData()
        currentGalleries = downloadedGalleries
        return downloadedGalleries
    }

    func remove(gallery: Gallery) {
        currentGalleries?.removeAll(where: { $0.name == gallery.name })
    }
}
