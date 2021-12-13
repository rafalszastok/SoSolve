//
//  GalleryListCollectionViewCell.swift
//  SoSolve
//
//  Created by Rafal Szastok on 12/12/2021.
//

import Kingfisher
import UIKit

struct GalleryListCellStyle {
    static let insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    static let interitemSpacing: CGFloat = 16
    static let labelDescriptionSpacing: CGFloat = 16
    static let imageRatio: CGFloat = 1.0

    static func backgroundColor(isSelected: Bool) -> UIColor {
        return isSelected ? .systemOrange : .white
    }

    static let imageBackgroundColor = UIColor(white: 0.0, alpha: 0.05)
}

final class GalleryListCollectionViewCell: UICollectionViewCell {
    typealias Style = GalleryListCellStyle

    static let reuseIdentifier = "GalleryListCollectionViewCell"

    var galleryImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = Style.imageBackgroundColor
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()

    var galleryDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Helvetica", size: 16)
        label.textColor = .black
        return label
    }()

    var model: GalleryItem? {
        didSet {
            applyModel()
        }
    }

    override var isSelected: Bool {
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

    override func layoutSubviews() {
        super.layoutSubviews()
        galleryImageView.layer.cornerRadius = round(galleryImageView.bounds.width / 2)
    }

    private func setup() {
        setupConstraints()
    }

    private func setupStyle() {
        backgroundColor = Style.backgroundColor(isSelected: false)
    }

    private func setupConstraints() {
        addSubview(galleryImageView)
        addSubview(galleryDescriptionLabel)

        // Horizontal
        NSLayoutConstraint.activate([
            galleryImageView.leadingAnchor.constraint(
                equalTo: leadingAnchor,
                constant: Style.insets.left
            ),
            galleryDescriptionLabel.leadingAnchor.constraint(
                equalTo: galleryImageView.trailingAnchor,
                constant: Style.labelDescriptionSpacing
            ),
            trailingAnchor.constraint(
                equalTo: galleryDescriptionLabel.trailingAnchor,
                constant: Style.insets.right
            ),
        ])

        // Vertical
        NSLayoutConstraint.activate([
            galleryImageView.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Style.insets.top
            ),
            bottomAnchor.constraint(
                equalTo: galleryImageView.bottomAnchor,
                constant: Style.insets.bottom
            ),
            galleryDescriptionLabel.topAnchor.constraint(
                equalTo: topAnchor,
                constant: Style.insets.top
            ),
            bottomAnchor.constraint(
                equalTo: galleryDescriptionLabel.bottomAnchor,
                constant: Style.insets.bottom
            ),
        ])

        // Other
        NSLayoutConstraint.activate([
            galleryImageView.heightAnchor.constraint(
                equalTo: galleryImageView.widthAnchor,
                multiplier: Style.imageRatio
            ),
        ])
    }

    private func applyModel() {
        guard let model = model else {
            return
        }

        backgroundColor = Style.backgroundColor(isSelected: isSelected)

        galleryDescriptionLabel.text = model.gallery.name

        guard let firstPhotoString = model.gallery.photoUrls.first, let photoUrl = URL(string: firstPhotoString) else {
            return
        }
        galleryImageView.kf.setImage(with: photoUrl, placeholder: nil, options: [.transition(.fade(1))])
    }
}
