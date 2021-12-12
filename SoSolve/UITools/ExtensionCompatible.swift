//
//  ProjectExtension.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import Foundation

public protocol ExtensionCompatible {

    associatedtype ObjectType

    var soSolve: ObjectType { get }

}

public extension ExtensionCompatible {

    var soSolve: SoSolveExtension<Self> {
        return SoSolveExtension(self)
    }
}

public struct SoSolveExtension<Base> {

    public let base: Base

    init(_ base: Base) {
        self.base = base
    }
}
