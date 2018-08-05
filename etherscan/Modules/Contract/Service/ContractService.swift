//
//  HTTPEtherscanService.swift
//  etherscan
//
//  Created by Oleg Kolomyitsev on 04/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import Foundation
import Alamofire
import PromiseKit
import UnboxedAlamofire

class ContractService: Service, IContractService {
    
    typealias Parameters = [String: String]
    
    let route = Constants.Etherscan.route
    let apiKey = Constants.Etherscan.apiKey
    let headers = ["Content-Type": "application/json"]

    // MARK: - IContractService
    
    public func getABI(_ address: String) -> Promise<ContractABI> {
        let dataRequest = buildRequest(address, .ABI)
        return Promise { seal in
            dataRequest.responseObject { (response: DataResponse<ContractABI>) in
                guard let container = response.value else {
                    if response.error != nil {
                        seal.reject(NetworkError.requestError)
                    } else {
                        seal.reject(NetworkError.unknownError)
                    }
                    
                    return
                }
                seal.fulfill(container)
            }
        }
    }
    
    public func getSourceCode(_ address: String) -> Promise<ContractSourceCode> {
        let dataRequest = buildRequest(address, .sourceCode)
        return Promise { seal in
            dataRequest.responseObject { (response: DataResponse<ContractSourceCode>) in
                guard let container = response.value else {
                    if response.error != nil {
                        seal.reject(NetworkError.requestError)
                    } else {
                        seal.reject(NetworkError.unknownError)
                    }
                    
                    return
                }
                seal.fulfill(container)
            }
        }
    }
    
    // MARK: - Building
    
    private func buildRequest(_ address: String, _ contract: EtherscanContract) -> DataRequest {
        return sessionManager.request(apiURL + route,
                                      method: .get,
                                      parameters: buildParams(address, contract),
                                      encoding: URLEncoding.queryString,
                                      headers: headers)
    }
    
    private func buildParams(_ address: String, _ contract: EtherscanContract) -> Parameters {
        let params: [EtherscanKey: String] = [
            .module : contract.module,
            .action : contract.action,
            .address : address,
            .apikey : apiKey
        ]

        return params.convertSelfToStringDictionary()
    }
}
