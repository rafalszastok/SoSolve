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

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView

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
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Style.insets.left),
            trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: Style.insets.right),
            imageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: Style.insets.top),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
        ])

        addSubview(deleteButton)
        NSLayoutConstraint.activate([
            deleteButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            deleteButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: Style.imageButtonSpacing),
        ])
    }
}
