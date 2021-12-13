//
//  MockedPersistenceSerivce.swift
//  SoSolveTests
//
//  Created by Rafal Szastok on 13/12/2021.
//

import Foundation
@testable import SoSolve

final class MockedGalleryPersistenceService: GalleryPersistenceService {
    var visibleGalleriesCallCounter = 0
    var mockedGalleries: [Gallery] = []
    func visibleGalleries() async -> [Gallery] {
        visibleGalleriesCallCounter += 1
        return mockedGalleries
    }

    var removeCallCounter = 0
    func remove(gallery _: Gallery) {
        removeCallCounter += 1
    }
}
