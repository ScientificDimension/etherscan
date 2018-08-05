//
//  INetworking.swift
//  etherscan
//
//  Created by Oleg Kolomyitsev on 04/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation
import Alamofire

public protocol INetworking {
    var sessionManager: SessionManager { get }
    var sessionManagerCache: SessionManager { get }
}
