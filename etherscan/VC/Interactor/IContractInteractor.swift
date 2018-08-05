//
//  IContractInteractor.swift
//  etherscan
//
//  Created by Oleg Kolomyitsev on 04/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation

typealias CanStart = Bool

protocol IContractInteractor {
    func tryGetContractABI(_ address: String) -> CanStart
}
