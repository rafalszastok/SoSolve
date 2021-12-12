//
//  GalleryDetailsViewController.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import UIKit

final class GalleryDetailsViewController: UIViewController {
    private var viewModel: GalleryDetailsViewModel!
    var collectionDataSource: GalleryDetailsDataSource!

    private lazy var galleryDetailsView: GalleryDetailsView = {
        GalleryDetailsView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.soSolve.layoutInstall(subview: galleryDetailsView)
        setupCollection()
        setupView()
    }

    func inject(viewModel: GalleryDetailsViewModel) {
        self.viewModel = viewModel
    }

    private func setupView() {
        title = viewModel.title
    }

    private func setupCollection() {

        collectionDataSource = GalleryDetailsDataSource(collectionView: galleryDetailsView.collectionView, cellProvider: {
            (collectionView, indexPath, galleryModel) -> GalleryDetailsCollectionViewCell? in

            let cell: GalleryDetailsCollectionViewCell = collectionView.dequeueReusableCell(
                withReuseIdentifier: GalleryDetailsCollectionViewCell.reuseIdentifier,
                for: indexPath
            ) as! GalleryDetailsCollectionViewCell
            cell.model = galleryModel
            return cell

        })

    }
}

extension GalleryDetailsViewController: GalleryDetailsViewModelDelegate {
    func show(snapshot: GalleryDetailsDataSourceSnapshot) {
        collectionDataSource.apply(snapshot, animatingDifferences: true)
    }
}
