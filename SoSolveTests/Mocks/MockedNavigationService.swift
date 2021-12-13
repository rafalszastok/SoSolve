//
//  MockedNavigationService.swift
//  SoSolveTests
//
//  Created by Rafal Szastok on 13/12/2021.
//

import Foundation
@testable import SoSolve

final class MockedNavigationService: NavigationService {
    var selectedCalledCount = 0
    func selected(gallery _: Gallery) {
        selectedCalledCount += 1
    }

    var dismissCurrentScreenCalledCount = 0
    func dismissCurrentScreen(animated _: Bool) {
        dismissCurrentScreenCalledCount += 1
    }

    var showCallback: ShowCallback?

    var customCallback: CustomActionCallback?
}
