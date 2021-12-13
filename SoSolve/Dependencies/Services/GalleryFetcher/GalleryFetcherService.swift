//
//  ContentLoadingService.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import Foundation

public protocol GalleryFetcherService {
    func fetchData() async -> [Gallery]
}

public final class ConcreteGalleryFetcherService: GalleryFetcherService {
    public func fetchData() async -> [Gallery] {
        return await withCheckedContinuation { continuation in
            GallerySDK.fetchData { result in
                continuation.resume(with: Result.success(result))
            }
        }
    }
}
