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
    case viewDidLoad
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

    private let resolver: Resolver

    private var downloadGalleriesTask: Task<Void, Never>? {
        didSet {
            oldValue?.cancel()
        }
    }

    init(resolver: Resolver) {
        self.resolver = resolver
    }

    func input(event: ListViewModelInputEvent) {
        switch event {
        case .viewDidLoad:
            fetchContent()
        case let .selected(galleryItem):
            let navigationService = resolver.resolve(NavigationService.self)!
            navigationService.selected(gallery: galleryItem.gallery)
        }
    }

    private func fetchContent() {
        let galleryContentService = resolver.resolve(GalleryContentService.self)!

        downloadGalleriesTask = Task.detached {
            let galleries = await galleryContentService.fetchData()
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
