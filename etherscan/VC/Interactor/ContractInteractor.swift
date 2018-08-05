//
//  ContractInteractor.swift
//  etherscan
//
//  Created by Oleg Kolomyitsev on 04/08/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import UIKit
import MBProgressHUD

class ContractInteractor: IContractInteractor {
    
    // MARK: - UI Assistants
    
    private let height: (button: CGFloat, statusBar: CGFloat) = (button: 30, statusBar: 20)
    private let buttonTitle: (ready: String, busy: String) = (ready: "Get Contract ABI", busy: "Retrieving ...")
    
    // MARK: - Contract Address
    
    private var address: String = ""
    
    // MARK: - Controls
    
    private weak var button: UIButton?
    private weak var label: UILabel?
    
    // MARK: - Services
    
    private let contract: IContractService = ContractService(
        apiURL: Constants.Etherscan.url,
        networking: Networking())

    
    // MARK: - Memory Management
    
    private weak var presenter: UIViewController?
    
    private let alertAssistant: IAlertAssistant
    
    init(_ presenter: UIViewController) {
        self.presenter = presenter
        self.alertAssistant = AlertAssistant(presenter)
    }
    
    // MARK: - IContractInteractor
    
    func tryGetContractABI(_ address: String) -> CanStart {
        
        guard let presenter = presenter else {
            return false
        }
        
        configure(address: address)
        configureLabel(presenter.view)
        configureButton(presenter.view)

        return true
    }
    
    // MARK: - Configurations
    
    private func configure(address: String) {
        self.address = address
    }
    
    private func configureLabel(_ view: UIView) {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: view.topAnchor, constant:height.button + height.statusBar).isActive = true
        label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        
        self.label = label
    }
    
    
    private func configureButton(_ view: UIView) {
        let button = UIButton()
        button.setTitle(buttonTitle.ready, for: .normal)
        button.addTarget(self, action: #selector(tap(_:)), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: view.topAnchor, constant: height.statusBar).isActive = true
        button.heightAnchor.constraint(equalToConstant: height.button).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        button.backgroundColor = .gray
        
        self.button = button
    }
    
    // MARK: - Tap Action
    
    @objc
    private func tap(_ sender: UIButton) {
        
        guard let presenter = presenter else {
            return
        }
        
        prepare(presenter.view)
        contract.getABI(address)
            
            .done { [unowned self] (contractABI) in
                self.update(contractABI.result)
            }
            
            .catch {[unowned self] error in
                self.showAlert(error)
            }
            
            .finally { [unowned self] in
                self.finish(presenter.view)
        }
    }
    
    // MARK: - Auxiliary Actions
    
    private func prepare(_ view: UIView) {
        print("start")
        MBProgressHUD.showAdded(to: view, animated: true)
        button?.isEnabled = false
        button?.setTitle(buttonTitle.busy, for: .normal)
    }
    
    private func finish(_ view: UIView) {
        print("finish")
        MBProgressHUD.hide(for: view, animated: true)
        button?.isEnabled = true
        button?.setTitle(buttonTitle.ready, for: .normal)
    }
    
    private func showAlert(_ error: Error) {
        print(error)
        alertAssistant.tryShowAlert(title: "\(error.localizedDescription)"){}
    }
    
    private func update(_ abi: String) {
        print(abi)
        label?.text = abi
    }
}
