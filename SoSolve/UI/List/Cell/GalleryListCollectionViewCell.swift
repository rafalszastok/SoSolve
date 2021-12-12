//
//  GalleryListCollectionViewCell.swift
//  SoSolve
//
//  Created by Rafal Szastok on 12/12/2021.
//

import UIKit

final class GalleryListCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "GalleryListCollectionViewCell"

    var model: GalleryItem? {
        didSet {
            applyModel()
        }
    }

    private func applyModel() {
        backgroundColor = .orange
        guard let model = model else {
            return
        }
    }
}
