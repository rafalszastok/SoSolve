//
//  ConcreteGalleryPersistenceServiceUnitTests.swift
//  SoSolveTests
//
//  Created by Rafal Szastok on 13/12/2021.
//

import Foundation
@testable import SoSolve
import XCTest

final class ConcreteGalleryPersistenceServiceUnitTests: XCTestCase {
    func testInitialState() async {
        // Given
        let components = prepareTestComponents()

        // When
        let galleries = await components.sut.visibleGalleries()

        // Then
        XCTAssert(galleries.count == 0)
    }

    func testDownloading2Items() async {
        // Given
        let components = prepareTestComponents()
        components.mockedGalleryFetcherService.mockedGalleries = [
            GalleryTestData.gallery1,
            GalleryTestData.gallery2,
        ]

        // When
        let galleries = await components.sut.visibleGalleries()

        // Then
        XCTAssert(galleries.count == 2)
    }

    func testDownloading4Items() async {
        // Given
        let components = prepareTestComponents()
        components.mockedGalleryFetcherService.mockedGalleries = [
            GalleryTestData.gallery1,
            GalleryTestData.gallery2,
            GalleryTestData.gallery3,
            GalleryTestData.gallery4,
        ]

        // When
        let galleries = await components.sut.visibleGalleries()

        // Then
        XCTAssert(galleries.count == 4)
    }

    func testDownloadingNonUniqueItems() async {
        // Given
        let components = prepareTestComponents()
        components.mockedGalleryFetcherService.mockedGalleries = [
            GalleryTestData.gallery1,
            GalleryTestData.gallery1,
            GalleryTestData.gallery1,
            GalleryTestData.gallery1,
        ]

        // When
        let galleries = await components.sut.visibleGalleries()

        // Then
        XCTAssert(galleries.count == 4)
    }

    func testFetchingAPICallOnce() async {
        // Given
        let components = prepareTestComponents()
        components.mockedGalleryFetcherService.mockedGalleries = [
            GalleryTestData.gallery2,
            GalleryTestData.gallery1,
        ]

        // When
        _ = await components.sut.visibleGalleries()
        _ = await components.sut.visibleGalleries()

        // Then
        XCTAssert(components.mockedGalleryFetcherService.fetchDataCalls == 1)
    }

    func testDeletingItem() async {
        // Given
        let components = prepareTestComponents()
        components.mockedGalleryFetcherService.mockedGalleries = [
            GalleryTestData.gallery1,
            GalleryTestData.gallery2,
            GalleryTestData.gallery3,
            GalleryTestData.gallery4,
        ]

        // WHEN We download galleries
        _ = await components.sut.visibleGalleries()

        // And remove first one
        components.sut.remove(gallery: GalleryTestData.gallery3)

        // Then
        let expectedGalleries = [
            GalleryTestData.gallery1,
            GalleryTestData.gallery2,
            GalleryTestData.gallery4,
        ]
        let visibleGalleries = await components.sut.visibleGalleries()

        XCTAssert(visibleGalleries == expectedGalleries)
    }

    func testDeletingTheSameItem4times() async {
        // Given
        let components = prepareTestComponents()
        components.mockedGalleryFetcherService.mockedGalleries = [
            GalleryTestData.gallery1,
            GalleryTestData.gallery2,
            GalleryTestData.gallery3,
            GalleryTestData.gallery4,
        ]

        // WHEN We download galleries
        _ = await components.sut.visibleGalleries()

        // And remove first one
        components.sut.remove(gallery: GalleryTestData.gallery3)
        components.sut.remove(gallery: GalleryTestData.gallery3)
        components.sut.remove(gallery: GalleryTestData.gallery3)
        components.sut.remove(gallery: GalleryTestData.gallery3)

        // Then
        let expectedGalleries = [
            GalleryTestData.gallery1,
            GalleryTestData.gallery2,
            GalleryTestData.gallery4,
        ]
        let visibleGalleries = await components.sut.visibleGalleries()

        XCTAssert(visibleGalleries == expectedGalleries)
    }

    func testDeletingAllItemsOneByOne() async {
        // Given
        let components = prepareTestComponents()
        components.mockedGalleryFetcherService.mockedGalleries = [
            GalleryTestData.gallery1,
            GalleryTestData.gallery2,
            GalleryTestData.gallery3,
            GalleryTestData.gallery4,
        ]

        // WHEN We download galleries
        _ = await components.sut.visibleGalleries()

        // And remove first one
        components.sut.remove(gallery: GalleryTestData.gallery3)
        components.sut.remove(gallery: GalleryTestData.gallery4)
        components.sut.remove(gallery: GalleryTestData.gallery2)
        components.sut.remove(gallery: GalleryTestData.gallery1)

        // Then
        let visibleGalleries = await components.sut.visibleGalleries()

        XCTAssert(visibleGalleries.count == 0)
    }

    typealias TestComponents = (
        sut: ConcreteGalleryPersistenceService,
        mockedGalleryFetcherService: MockedGalleryFetcherService
    )

    private func prepareTestComponents() -> TestComponents {
        let mockedGalleryFetcherService = MockedGalleryFetcherService()
        let sut = ConcreteGalleryPersistenceService(galleryFetcherService: mockedGalleryFetcherService)
        return (sut: sut, mockedGalleryFetcherService: mockedGalleryFetcherService)
    }
}

extension Gallery: Equatable {
    public static func == (lhs: Gallery, rhs: Gallery) -> Bool {
        lhs.name == rhs.name
    }
}
