//
//  ListViewController.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import UIKit

final class ListViewController: UIViewController {
    private var viewModel: ListViewModel!
    var collectionDataSource: GalleryListDataSource!

    private lazy var listView: ListView = {
        ListView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.soSolve.layoutInstall(subview: listView)
        setupCollection()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.input(event: .viewWillAppear)
    }

    func inject(viewModel: ListViewModel) {
        self.viewModel = viewModel
    }

    private func setupCollection() {
        listView.collectionView.delegate = self

        collectionDataSource = GalleryListDataSource(collectionView: listView.collectionView, cellProvider: {
            (collectionView, indexPath, galleryModel) -> GalleryListCollectionViewCell? in

            let cell: GalleryListCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: GalleryListCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as! GalleryListCollectionViewCell
            cell.model = galleryModel
            return cell

        })
    }
}

extension ListViewController: ListViewModelDelegate {
    func show(snapshot: GalleryListDataSourceSnapshot) {
        collectionDataSource.apply(snapshot, animatingDifferences: true)
    }
}

extension ListViewController: UICollectionViewDelegate {
    func collectionView(_: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let item = collectionDataSource.itemIdentifier(for: indexPath) else {
            assertionFailure("Could not obtain item from data source")
            return
        }
        viewModel.input(event: .selected(item))
    }
}
