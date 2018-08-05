//
//  AlertAssistant.swift
//  062_path
//
//  Created by Oleg Kolomyitsev on 30/07/2018.
//  Copyright © 2018 Oleg Kolomyitsev. All rights reserved.
//

import UIKit

class AlertAssistant: IAlertAssistant {
    
    // MARK: - Memory Management
    
    weak var presenter: UIViewController?
    
    init(_ presenter: UIViewController) {
        self.presenter = presenter
    }
    
    // MARK: - IAlertAssistant
    
    func tryShowAlert(title: String,  completion: @escaping EmptyClosure) {
        let alert = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default) { (_) in
            completion()
        }
        alert.addAction(action)
        presenter?.present(alert, animated: true, completion: nil)
    }
}
