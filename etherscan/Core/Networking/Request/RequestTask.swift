//
//  RequestTask.swift
//  etherscan
//
//  Created by Oleg Kolomyitsev on 04/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation
import Alamofire

public class RequestTask: IRequestTask {
    
    // MARK: - Memory Managment

    private let dataRequest: Request
    
    init(dataRequest: Request) {
        self.dataRequest = dataRequest
    }
    
    // MARK: - IRequestTask
    
    open func resume() {
        dataRequest.resume()
    }
    
    open func suspend() {
        dataRequest.suspend()
    }
    
    open func cancel() {
        dataRequest.cancel()
    }
}
