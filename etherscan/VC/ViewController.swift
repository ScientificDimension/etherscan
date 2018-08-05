//
//  ViewController.swift
//  etherscan
//
//  Created by Oleg Kolomyitsev on 04/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Interactor
    
    private lazy var interactor: IContractInteractor = ContractInteractor(self)
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let address = "0x2f19A4e93af46C1b0538e9dF1eB2219A743b5D5C"
        let canStart = interactor.tryGetContractABI(address)
        
        guard canStart else {
            print("Error: failed to start interactor")
            return
        }
    }
}

