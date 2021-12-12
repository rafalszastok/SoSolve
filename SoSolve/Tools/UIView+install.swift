//
//  UIView+install.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import UIKit

extension UIView: ExtensionCompatible {}

extension SoSolveExtension where Base: UIView {
    func layoutInstall(subview: UIView, insets: UIEdgeInsets = .zero) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        base.addSubview(subview)
        NSLayoutConstraint.activate([
            base.leadingAnchor.constraint(
                equalTo: subview.leadingAnchor, constant: insets.left
            ),
            base.trailingAnchor.constraint(
                equalTo: subview.trailingAnchor, constant: -insets.right
            ),
            base.topAnchor.constraint(
                equalTo: subview.topAnchor, constant: insets.top
            ),
            base.bottomAnchor.constraint(
                equalTo: subview.bottomAnchor, constant: -insets.bottom
            ),
        ])
    }
}
