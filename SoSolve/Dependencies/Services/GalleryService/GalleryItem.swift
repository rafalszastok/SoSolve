//
//  GalleryItem.swift
//  SoSolve
//
//  Created by Rafal Szastok on 12/12/2021.
//

import Foundation

struct GalleryItem: Hashable {

    let uuid = UUID()
    let gallery: Gallery

    public static func == (lhs: GalleryItem, rhs: GalleryItem) -> Bool {
        return lhs.uuid == rhs.uuid
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(gallery.name ?? "")
        hasher.combine(uuid)
    }
}

