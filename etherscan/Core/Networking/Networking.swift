//
//  Networking.swift
//  etherscan
//
//  Created by Oleg Kolomyitsev on 04/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation
import Alamofire

public class Networking: INetworking {
    
    private enum Consts {
        
        static let memorySpaceMB = 100
        static let memoryCapacity = memorySpaceMB * 1024 * 1024
        
        static let diskSpaceMB = 300
        static let diskCapacity = diskSpaceMB * 1024 * 1024
        
        static let defaultHTTPTimeoutInterval: TimeInterval = 20 * 10
    }
    
    // MARK: - Session Manager
    
    private let accessTokenAdapter = AccessTokenAdapter()
    
    private let configuration: URLSessionConfiguration
    public let sessionManager: SessionManager
    
    private let configurationCache: URLSessionConfiguration
    public let sessionManagerCache: SessionManager
    
    // MARK: - Memory Managments
    
    init() {
        
        /// SessionManager without cache
        configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = Consts.defaultHTTPTimeoutInterval
        
        sessionManager = Alamofire.SessionManager(configuration: configuration)
        sessionManager.adapter = accessTokenAdapter
        
        /// SessionManager with cache
        configurationCache = URLSessionConfiguration.default
        configurationCache.timeoutIntervalForRequest = Consts.defaultHTTPTimeoutInterval
        
        configurationCache.requestCachePolicy = .returnCacheDataElseLoad
        configurationCache.urlCache = URLCache(memoryCapacity: Consts.memoryCapacity,
                                               diskCapacity: Consts.diskCapacity,
                                               diskPath: "Alamofire_cache")
        
        sessionManagerCache = Alamofire.SessionManager(configuration: configurationCache)
        sessionManagerCache.adapter = accessTokenAdapter
        
    }
}
