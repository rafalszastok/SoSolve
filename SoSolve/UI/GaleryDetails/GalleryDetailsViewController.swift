//
//  GalleryDetailsViewController.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import Kingfisher
import UIKit

final class GalleryDetailsViewController: UIViewController {
    private var viewModel: GalleryDetailsViewModel!

    private lazy var galleryDetailsView: GalleryDetailsView = {
        GalleryDetailsView()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.soSolve.layoutInstall(subview: galleryDetailsView)

        setupView()
        viewModel.input(event: .viewDidLoad)
        galleryDetailsView.deleteButton.addTarget(self, action: #selector(removeButtonTapped), for: .touchUpInside)
    }

    @IBAction func removeButtonTapped() {
        viewModel.input(event: .removeButtonTapped)
    }

    func inject(viewModel: GalleryDetailsViewModel) {
        self.viewModel = viewModel
    }

    private func setupView() {
        title = viewModel.title
    }
}

extension GalleryDetailsViewController: GalleryDetailsViewModelDelegate {
    func show(imageUrl: URL) {
        galleryDetailsView.imageView.kf.setImage(with: imageUrl, options: [.transition(.fade(1))])
    }
}
