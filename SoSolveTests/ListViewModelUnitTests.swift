//
//  ListViewModelUnitTests.swift
//  SoSolveTests
//
//  Created by Rafal Szastok on 13/12/2021.
//

import Foundation
@testable import SoSolve
import XCTest

final class ListViewModelUnitTests: XCTestCase {
    func testInitialState() async {
        let testComponents = prepareTestComponents()
        XCTAssertEqual(testComponents.mockedListViewModelDelegate.showSnapshotCallCount, 0)
        XCTAssert(testComponents.mockedListViewModelDelegate.recentShowSnapshotArgument == nil)
    }

    func testDownloadingOnViewAppear() async {
        // Given
        let testComponents = prepareTestComponents()
        testComponents.galleryPersistenceService.mockedGalleries = [
            GalleryTestData.gallery1,
            GalleryTestData.gallery2,
            GalleryTestData.gallery3,
            GalleryTestData.gallery4,
        ]

        // When
        testComponents.sut.input(event: .viewWillAppear)

        // Then
        let expectation = expectation(description: "Wait for downloading galleries")
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(10)) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        XCTAssert(testComponents.mockedListViewModelDelegate.recentShowSnapshotArgument?.numberOfSections == 1)
        XCTAssert(testComponents.mockedListViewModelDelegate.recentShowSnapshotArgument?.numberOfItems == 4)
    }

    func testDownloadingWithInvalid2Names() async {
        // Given
        let testComponents = prepareTestComponents()
        testComponents.galleryPersistenceService.mockedGalleries = [
            GalleryTestData.gallery2,
            GalleryTestData.galleryNoName,
            GalleryTestData.gallery3,
            GalleryTestData.galleryEmptyName,
        ]

        // When
        testComponents.sut.input(event: .viewWillAppear)

        // Then
        let expectation = expectation(description: "Wait for downloading galleries")
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(10)) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        XCTAssert(testComponents.mockedListViewModelDelegate.recentShowSnapshotArgument?.numberOfSections == 1)
        XCTAssert(testComponents.mockedListViewModelDelegate.recentShowSnapshotArgument?.numberOfItems == 2)
    }

    func testDownloadingWithEmptyImageURLs() async {
        // Given
        let testComponents = prepareTestComponents()
        testComponents.galleryPersistenceService.mockedGalleries = [
            GalleryTestData.gallery1,
            GalleryTestData.galleryNoImages,
            GalleryTestData.gallery3,
        ]

        // When
        testComponents.sut.input(event: .viewWillAppear)

        // Then
        let expectation = expectation(description: "Wait for downloading galleries")
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(10)) {
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 1.0)
        XCTAssert(testComponents.mockedListViewModelDelegate.recentShowSnapshotArgument?.numberOfSections == 1)
        XCTAssert(testComponents.mockedListViewModelDelegate.recentShowSnapshotArgument?.numberOfItems == 2)
    }

    typealias TestComponents = (
        sut: ListViewModel,
        galleryPersistenceService: MockedGalleryPersistenceService,
        navigationService: MockedNavigationService,
        mockedListViewModelDelegate: MockedListViewModelDelegate
    )

    private func prepareTestComponents() -> TestComponents {
        let mockedGalleryPersistenceService = MockedGalleryPersistenceService()
        let mockedNavigationService = MockedNavigationService()
        let mockedListViewModelDelegate = MockedListViewModelDelegate()

        let sut = ListViewModel(
            galleryPersistenceService: mockedGalleryPersistenceService,
            navigationService: mockedNavigationService
        )
        sut.delegate = mockedListViewModelDelegate

        return (sut: sut,
                galleryPersistenceService: mockedGalleryPersistenceService,
                navigationService: mockedNavigationService,
                mockedListViewModelDelegate: mockedListViewModelDelegate)
    }
}

final class MockedListViewModelDelegate: ListViewModelDelegate {
    var recentShowSnapshotArgument: GalleryListDataSourceSnapshot?
    var showSnapshotCallCount = 0
    func show(snapshot: GalleryListDataSourceSnapshot) {
        showSnapshotCallCount += 1
        recentShowSnapshotArgument = snapshot
    }
}
