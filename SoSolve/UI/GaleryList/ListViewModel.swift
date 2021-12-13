//
//  ListViewModel.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import Foundation
import Swinject
import UIKit

enum ListViewModelInputEvent {
    case viewWillAppear
    case selected(GalleryItem)
}

enum GalleryListSection {
    case main
}

typealias GalleryListDataSource = UICollectionViewDiffableDataSource<GalleryListSection, GalleryItem>
typealias GalleryListDataSourceSnapshot = NSDiffableDataSourceSnapshot<GalleryListSection, GalleryItem>

protocol ListViewModelDelegate: AnyObject {
    func show(snapshot: GalleryListDataSourceSnapshot)
}

final class ListViewModel {
    weak var delegate: ListViewModelDelegate?

    private let galleryPersistenceService: GalleryPersistenceService
    private let navigationService: NavigationService

    private var downloadGalleriesTask: Task<Void, Never>? {
        didSet {
            oldValue?.cancel()
        }
    }

    init(
        galleryPersistenceService: GalleryPersistenceService,
        navigationService: NavigationService
    ) {
        self.galleryPersistenceService = galleryPersistenceService
        self.navigationService = navigationService
    }

    func input(event: ListViewModelInputEvent) {
        switch event {
        case .viewWillAppear:
            fetchContent()
        case let .selected(galleryItem):
            navigationService.selected(gallery: galleryItem.gallery)
        }
    }

    private func fetchContent() {
        downloadGalleriesTask = Task.detached {
            [unowned self] in
            let galleries = await self.galleryPersistenceService.visibleGalleries()
                .filter {
                    gallery in
                    guard let name = gallery.name else {
                        return false
                    }
                    return !name.isEmpty && gallery.photoUrls.count > 0
                }
                .map { GalleryItem(gallery: $0) }

            DispatchQueue.main.async {
                var dataSourceSnapshot = GalleryListDataSourceSnapshot()
                dataSourceSnapshot.appendSections([GalleryListSection.main])
                dataSourceSnapshot.appendItems(galleries)
                self.delegate?.show(snapshot: dataSourceSnapshot)
            }
        }
    }
}
