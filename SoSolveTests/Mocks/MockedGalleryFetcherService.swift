//
//  MockedGalleryFetcherService.swift
//  SoSolveTests
//
//  Created by Rafal Szastok on 13/12/2021.
//

import Foundation
@testable import SoSolve

final class MockedGalleryFetcherService: GalleryFetcherService {
    var mockedGalleries: [Gallery] = []

    var fetchDataCalls: Int = 0
    func fetchData() async -> [Gallery] {
        fetchDataCalls += 1
        return mockedGalleries
    }
}
