//
//  GalleryDetailsViewModel.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import Foundation
import Swinject
import UIKit

enum GalleryDetailsViewModelInputEvent {
    case removeButtonTapped
    case viewDidLoad
}

enum GalleryDetailsSection {
    case main
}

protocol GalleryDetailsViewModelDelegate: AnyObject {
    func show(imageUrl: URL)
}

final class GalleryDetailsViewModel {
    weak var delegate: GalleryDetailsViewModelDelegate?

    private let galleryPersistenceService: GalleryPersistenceService
    private let navigationService: NavigationService
    private let refreshInterval: TimeInterval
    private let gallery: Gallery

    private var imagesToPresent: [URL] = []
    private var currentImageIndex = 0
    private var simpleTimer: SimpleTimer?

    init(
        galleryPersistenceService: GalleryPersistenceService,
        navigationService: NavigationService,
        gallery: Gallery,
        refreshInterval: TimeInterval = 6
    ) {
        self.galleryPersistenceService = galleryPersistenceService
        self.navigationService = navigationService
        self.gallery = gallery
        self.refreshInterval = refreshInterval
        imagesToPresent = gallery.photoUrls.compactMap { URL(string: $0) }
    }

    func input(event: GalleryDetailsViewModelInputEvent) {
        switch event {
        case .viewDidLoad:
            startChangingImages()

        case .removeButtonTapped:
            galleryPersistenceService.remove(gallery: gallery)
            navigationService.dismissCurrentScreen(animated: true)
        }
    }

    var title: String {
        return gallery.name ?? ""
    }

    private func startChangingImages() {

        let currentImageUrl = imagesToPresent[currentImageIndex]
        delegate?.show(imageUrl: currentImageUrl)

        guard imagesToPresent.count > 1 else {
            return
        }
        
        simpleTimer = SimpleTimer(delay: refreshInterval, repeats: true, action: {
            [weak self] in
            self?.changeImage()
        })
    }

    private func changeImage() {
        currentImageIndex = (currentImageIndex + 1) % imagesToPresent.count
        let currentImageUrl = imagesToPresent[currentImageIndex]
        delegate?.show(imageUrl: currentImageUrl)
    }
}
