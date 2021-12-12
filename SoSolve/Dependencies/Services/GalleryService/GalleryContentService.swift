//
//  ContentLoadingService.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import Foundation

public protocol GalleryContentService {
    func fetchData() async -> [Gallery]
}

public final class ConcreteGalleryContentService: GalleryContentService {
    public func fetchData() async -> [Gallery] {
        return await withCheckedContinuation { continuation in
            GallerySDK.fetchData { result in
                continuation.resume(with: Result.success(result))
            }
        }
    }
}
