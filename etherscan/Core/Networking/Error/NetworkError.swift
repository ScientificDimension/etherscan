//
//  NetworkError.swift
//  etherscan
//
//  Created by Oleg Kolomyitsev on 04/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation

public enum NetworkError: Error {
    case requestTimeoutError
    case requestError
    case authorizationError
    case unknownError
    case emptyResponseError
    case serializationError
    case serverError(message: String, code: Int)
    case networkError
}
