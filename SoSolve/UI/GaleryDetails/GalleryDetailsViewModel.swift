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
}

enum GalleryDetailsSection {
    case main
}

typealias GalleryDetailsDataSource = UICollectionViewDiffableDataSource<GalleryDetailsSection, GalleryDetailsImageModel>
typealias GalleryDetailsDataSourceSnapshot = NSDiffableDataSourceSnapshot<GalleryDetailsSection, GalleryDetailsImageModel>

protocol GalleryDetailsViewModelDelegate: AnyObject {
    func show(snapshot: GalleryDetailsDataSourceSnapshot)
}

final class GalleryDetailsViewModel {
    weak var delegate: GalleryDetailsViewModelDelegate?

    private let resolver: Resolver
    private let gallery: Gallery

    init(resolver: Resolver, gallery: Gallery) {
        self.resolver = resolver
        self.gallery = gallery
    }

    func input(event: GalleryDetailsViewModelInputEvent) {
        switch event {
        case .removeItem:
            break//TODO
        }
    }

    var title: String {
        return gallery.name ?? ""
    }

}
