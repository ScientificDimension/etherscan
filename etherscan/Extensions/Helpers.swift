//
//  Helpers.swift
//  etherscan
//
//  Created by Oleg Kolomyitsev on 04/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation

enum EtherscanKey: String {
    case module
    case action
    case address
    case apikey
}

extension Dictionary where Key == EtherscanKey, Value == String {
    
    func convertSelfToStringDictionary() -> [String: String] {
        var params: [String: String] = [:]
        self.forEach{ params[$0.key.rawValue] = $0.value }
        
        return params
    }
    
}
