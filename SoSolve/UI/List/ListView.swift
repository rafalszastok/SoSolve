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

    var dataSource: GalleryListDataSource!

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

        dataSource = GalleryListDataSource(collectionView: collectionView, cellProvider: {
            (collectionView, indexPath, galleryModel) -> GalleryListCollectionViewCell? in

            let cell: GalleryListCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: GalleryListCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as! GalleryListCollectionViewCell
            cell.model = galleryModel
            return cell

        })
    }


    private static func makeCollectionViewLayout() -> UICollectionViewLayout {

        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            let configution = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
            let section = NSCollectionLayoutSection.list(using: configution, layoutEnvironment: layoutEnvironment)
            section.interGroupSpacing = 10
            return section
        }

        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
}
