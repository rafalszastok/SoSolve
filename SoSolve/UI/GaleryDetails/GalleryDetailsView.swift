//
//  GalleryDetailsView.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import UIKit

struct GalleryDetailsStyle {
    static let insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    static let imageButtonSpacing: CGFloat = 48
}

final class GalleryDetailsView: UIView {

    typealias Style = GalleryDetailsStyle

    lazy var deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("DELETE", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var collectionView: UICollectionView = {

        let layout = GalleryDetailsView.makeCollectionViewLayout()
        let collectionView = UICollectionView(
            frame: bounds,
            collectionViewLayout: layout
        )

        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(
            GalleryDetailsCollectionViewCell.self,
            forCellWithReuseIdentifier: GalleryDetailsCollectionViewCell.reuseIdentifier
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
        backgroundColor = .lightGray

        // Collection view
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Style.insets.left),
            trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: Style.insets.right),
            collectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Style.insets.top),
            collectionView.heightAnchor.constraint(equalTo: collectionView.widthAnchor)
        ])

        addSubview(deleteButton)
        NSLayoutConstraint.activate([
            deleteButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            deleteButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: Style.imageButtonSpacing)
        ])


    }

    private static func makeCollectionViewLayout() -> UICollectionViewLayout {
        let fraction: CGFloat = 2/3

        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(fraction), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(fraction))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])

        // Section
        let section = NSCollectionLayoutSection(group: group)
        return UICollectionViewCompositionalLayout(section: section)
    }
}
