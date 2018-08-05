//
//  ContractSourceCode.swift
//  etherscan
//
//  Created by Oleg Kolomyitsev on 04/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation
import Unbox

public struct ContractSourceCode: Unboxable {
    let status: Int
    let result: ContractSourceCodeResult
    let message: String
    
    // MARK: - Unboxable
    
    public init(unboxer: Unboxer) throws {
        status = try unboxer.unbox(keyPath: "status") as Int
        result = try unboxer.unbox(keyPath: "result") as ContractSourceCodeResult
        message = try unboxer.unbox(keyPath: "message") as String
    }
}

// MARK: - Auxiliary

public struct ContractSourceCodeResult: Unboxable {
    let ABI: String
    let runs: Int
    let library: String
    let sourceCode: String
    let swarmSource: String
    let contractName: String
    let compilerVersion: String
    let optimizationUsed: String
    let constructorArguments: String
    
    // MARK: - Unboxable
    
    public init(unboxer: Unboxer) throws {
        ABI = try unboxer.unbox(keyPath: "ABI") as String
        runs = try unboxer.unbox(keyPath: "Runs") as Int
        library = try unboxer.unbox(keyPath: "Library") as String
        sourceCode = try unboxer.unbox(keyPath: "SourceCode") as String
        swarmSource = try unboxer.unbox(keyPath: "SwarmSource") as String
        contractName = try unboxer.unbox(keyPath: "ContractName") as String
        compilerVersion = try unboxer.unbox(keyPath: "CompilerVersion") as String
        optimizationUsed = try unboxer.unbox(keyPath: "OptimizationUsed") as String
        constructorArguments = try unboxer.unbox(keyPath: "ConstructorArguments") as String
    }

}
