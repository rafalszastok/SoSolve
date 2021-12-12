//
//  ListView.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import UIKit

final class ListView: UIView {

    lazy var collectionView: UICollectionView = {

        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(
            frame: bounds,
            collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            GalleryListCollectionViewCell.self,
            forCellWithReuseIdentifier: GalleryListCollectionViewCell.reuseIdentifier)
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

    init() {
        super.init(frame: CGRect.zero)
        setup()
    }

    private func setup() {
        backgroundColor = .orange
        soSolve.layoutInstall(subview: collectionView)

        dataSource = GalleryListDataSource(collectionView: collectionView, cellProvider: {
           (collectionView, indexPath, galleryModel) -> GalleryListCollectionViewCell? in


            let cell: GalleryListCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: GalleryListCollectionViewCell.reuseIdentifier,
                for: indexPath) as! GalleryListCollectionViewCell
           cell.model = galleryModel
           return cell

       })
    }
}
