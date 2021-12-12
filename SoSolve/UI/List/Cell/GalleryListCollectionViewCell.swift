//
//  GalleryListCollectionViewCell.swift
//  SoSolve
//
//  Created by Rafal Szastok on 12/12/2021.
//

import UIKit

struct GalleryListCellStyle {
    static let insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    static let spacing: CGFloat = 8
}

final class GalleryListCollectionViewCell: UICollectionViewCell {
    typealias Style = GalleryListCellStyle

    static let reuseIdentifier = "GalleryListCollectionViewCell"

    var galleryImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .gray
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    var galleryDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 16)
        return label
    }()

    var model: GalleryItem? {
        didSet {
            applyModel()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        setupConstraints()
    }

    private func setupConstraints() {
        addSubview(galleryImageView)
        addSubview(galleryDescriptionLabel)

        // Horizontal
        NSLayoutConstraint.activate([
            galleryImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Style.insets.left),
            galleryDescriptionLabel.leadingAnchor.constraint(
                equalTo: galleryImageView.trailingAnchor,
                constant: Style.spacing),
            trailingAnchor.constraint(
                equalTo: galleryDescriptionLabel.trailingAnchor,
                constant: Style.insets.right)
        ])

        // Vertical
        NSLayoutConstraint.activate([
            galleryImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Style.insets.top),
            galleryImageView.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Style.insets.bottom),
            galleryDescriptionLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Style.insets.top),
            galleryDescriptionLabel.bottomAnchor.constraint(
                equalTo: bottomAnchor,
                constant: Style.insets.bottom)
        ])
    }

    private func applyModel() {
        backgroundColor = .orange
        guard let model = model else {
            return
        }
        galleryDescriptionLabel.text = model.gallery.name
    }
}
