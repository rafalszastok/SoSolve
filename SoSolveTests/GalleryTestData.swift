//
//  GalleryTestData.swift
//  SoSolveTests
//
//  Created by Rafal Szastok on 13/12/2021.
//

import Foundation
@testable import SoSolve

enum GalleryTestData {
    static let gallery1 = Gallery(
        name: "Gallery 1",
        photoUrls: [
            "https://i.picsum.photos/id/525/400/600.jpg?hmac=_zlzIkPg3CNYPTetyB8vL7b-P9L6ewiA9JPm7zOdnpo",
            "https://i.picsum.photos/id/813/400/600.jpg?hmac=r6ECo81hAQVvDEU1kPDzMXDtcbFESDW5BhGo7Hr09IM",
            "https://i.picsum.photos/id/620/400/600.jpg?hmac=JTtpWi0WE4iY58SEBrL0UmYvsnM2BlX_vO9mZ--FKi8",
        ]
    )

    static let gallery2 = Gallery(
        name: "Gallery 2",
        photoUrls: [
            "https://i.picsum.photos/id/525/400/600.jpg?hmac=_zlzIkPg3CNYPTetyB8vL7b-P9L6ewiA9JPm7zOdnpo",
            "https://i.picsum.photos/id/813/400/600.jpg?hmac=r6ECo81hAQVvDEU1kPDzMXDtcbFESDW5BhGo7Hr09IM",
            "https://i.picsum.photos/id/620/400/600.jpg?hmac=JTtpWi0WE4iY58SEBrL0UmYvsnM2BlX_vO9mZ--FKi8",
        ]
    )
    static let gallery3 = Gallery(
        name: "Gallery 3",
        photoUrls: [
            "https://i.picsum.photos/id/700/400/600.jpg?hmac=yRfyyFLHkStyTh-W7-Fn8zUyo2CsA9JMTK-yaFPZM_k",
            "https://i.picsum.photos/id/737/400/600.jpg?hmac=IPiUHLs2hLTN2WwhSqH19-HMNlNcTkn7AwIcs3COtcQ",
        ]
    )
    static let gallery4 = Gallery(
        name: "Gallery 4",
        photoUrls: [
            "https://i.picsum.photos/id/259/400/600.jpg?hmac=6QvQpG7hZ4TweouYskbZ6qniH7LgZLFi7TyibSBiRdg",
        ]
    )

    static let galleryNoName = Gallery(
        name: nil,
        photoUrls: [
            "https://i.picsum.photos/id/259/400/600.jpg?hmac=6QvQpG7hZ4TweouYskbZ6qniH7LgZLFi7TyibSBiRdg",
        ]
    )

    static let galleryEmptyName = Gallery(
        name: "",
        photoUrls: [
            "https://i.picsum.photos/id/259/400/600.jpg?hmac=6QvQpG7hZ4TweouYskbZ6qniH7LgZLFi7TyibSBiRdg",
        ]
    )

    static let galleryNoImages = Gallery(
        name: "No images",
        photoUrls: []
    )
}
