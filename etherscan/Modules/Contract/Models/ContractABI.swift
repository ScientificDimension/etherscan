//
//  ContractABI.swift
//  etherscan
//
//  Created by Oleg Kolomyitsev on 04/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation
import Unbox

public struct ContractABI: Unboxable {
    let status: String
    let result: String
    let message: String
    
    // MARK: - Unboxable
    
    public init(unboxer: Unboxer) throws {
        status = try unboxer.unbox(keyPath: "status") as String
        result = try unboxer.unbox(keyPath: "result") as String
        message = try unboxer.unbox(keyPath: "message") as String
    }
}
