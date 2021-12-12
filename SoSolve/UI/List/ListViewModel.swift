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
    private let resolver: Resolver
    private weak var delegate: ListViewModelDelegate?

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
        }
    }

    private func fetchContent() {
        guard let galeryContentService = resolver.resolve(GalleryContentService.self) else {
            assertionFailure("galeryContentService not set up")
            return
        }

        downloadGalleriesTask = Task.detached {
            let galleries = await galeryContentService.fetchData().map { GalleryItem(gallery: $0) }

            DispatchQueue.main.async {
                var dataSourceSnapshot = GalleryListDataSourceSnapshot()
                dataSourceSnapshot.appendSections([GalleryListSection.main])
                dataSourceSnapshot.appendItems(galleries)
                self.delegate?.show(snapshot: dataSourceSnapshot)
            }
        }
    }
}
