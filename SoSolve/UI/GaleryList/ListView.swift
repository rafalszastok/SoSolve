//
//  ListView.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import UIKit

final class ListView: UIView {
    lazy var collectionView: UICollectionView = {
        let layout = ListView.makeCollectionViewLayout()
        let collectionView = UICollectionView(
            frame: bounds,
            collectionViewLayout: layout
        )

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            GalleryListCollectionViewCell.self,
            forCellWithReuseIdentifier: GalleryListCollectionViewCell.reuseIdentifier
        )

        return collectionView

    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = .orange
        soSolve.layoutInstall(subview: collectionView)
    }

    private static func makeCollectionViewLayout() -> UICollectionViewLayout {
        let fraction: CGFloat = 1 / 4

        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        // Section
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
}
