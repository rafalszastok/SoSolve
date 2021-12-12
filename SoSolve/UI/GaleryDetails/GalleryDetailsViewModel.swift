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
    case removeItem
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

    private let refreshDuration: TimeInterval
    private let resolver: Resolver
    private let gallery: Gallery
    private var imagesToPresent: [URL] = []
    private var currentImageIndex = 0
    private var simpleTimer: SimpleTimer?

    init(resolver: Resolver, gallery: Gallery, refreshDuration: TimeInterval = 10) {
        self.resolver = resolver
        self.gallery = gallery
        self.refreshDuration = refreshDuration
        imagesToPresent = gallery.photoUrls.compactMap { URL(string: $0) }
    }

    func input(event: GalleryDetailsViewModelInputEvent) {
        switch event {
        case .viewDidLoad:
            startChangingImages()
        case .removeItem:
            break // TODO:
        }
    }

    var title: String {
        return gallery.name ?? ""
    }

    private func startChangingImages() {
        guard imagesToPresent.count > 1 else {
            return
        }

        let currentImageUrl = imagesToPresent[currentImageIndex]
        delegate?.show(imageUrl: currentImageUrl)

        simpleTimer = SimpleTimer(delay: refreshDuration, repeats: true, action: {
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
