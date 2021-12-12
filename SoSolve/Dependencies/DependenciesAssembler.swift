//
//  DependenciesAssembler.swift
//  SoSolve
//
//  Created by Rafal Szastok on 11/12/2021.
//

import Foundation
import Swinject

final class AssemblerFactory {
    static func make() -> Assembler {
        return Assembler(
            [DefaultAssembly()],
            parent: nil,
            defaultObjectScope: .container
        )
    }
}
