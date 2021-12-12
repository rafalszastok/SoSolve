//
//  GalleryDetailsCollectionViewCell.swift
//  SoSolve
//
//  Created by Rafal Szastok on 12/12/2021.
//

import UIKit

struct GalleryDetailsImageModel: Equatable, Hashable {
    let imageURL: URL
    let uuid: UUID
}

final class GalleryDetailsCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "GalleryDetailsCollectionViewCell"

    var model: GalleryDetailsImageModel? {
        didSet {
            //TODO
        }
    }
}

