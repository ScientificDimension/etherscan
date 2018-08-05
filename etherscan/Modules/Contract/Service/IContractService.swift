//
//  IHTTPEtherscanService.swift
//  etherscan
//
//  Created by Oleg Kolomyitsev on 04/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation
import PromiseKit

public enum EtherscanContract {
    
    case ABI
    case sourceCode /// Beta
    
    var module: String {
        return "contract"
    }
    
    var action: String {
        switch self {
        case .ABI:
            return "getabi"
        case .sourceCode:
            return "getsourcecode"
        }
    }
}

public protocol IContractService: AnyObject {
    func getABI(_ address: String) -> Promise<ContractABI>
    func getSourceCode(_ address: String) -> Promise<ContractSourceCode>
}
