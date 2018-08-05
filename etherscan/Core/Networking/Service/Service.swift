//
//  Service.swift
//  etherscan
//
//  Created by Oleg Kolomyitsev on 04/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation
import Alamofire

public class Service {
    
    // MARK: - Memory Managment
    
    let apiURL: String
    let networking: INetworking

    required public init(apiURL: String, networking: INetworking) {
        self.apiURL = apiURL
        self.networking = networking
    }

    // MARK: - Session Manager
    
    var sessionManager: SessionManager {
        return networking.sessionManager
    }
    
    var sessionManagerCache: SessionManager {
        return networking.sessionManagerCache
    }
}
