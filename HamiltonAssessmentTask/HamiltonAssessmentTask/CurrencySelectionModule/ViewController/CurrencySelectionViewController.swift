//
//  CurrencySelectionViewController.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import UIKit

class CurrencySelectionViewController: UIViewController {
    
    private let calculateButton: UIButton = {
        let button = CommonButoon()
        button.setTitle(Localization.calculate, for: [])
        return button
    }()
    
    private let amountTextField: UITextField = {
        let textField = UnderlinedTextField()
        textField.placeholder = "150" // TODO: Add to localization
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 48)
        textField.keyboardType = .numberPad
        textField.backgroundColor = .yellow
        return textField
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(calculateButton, constraints: [
            calculateButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 32),
            calculateButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -32),
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            calculateButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(amountTextField, constraints: [
            amountTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 32),
            amountTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -32),
            amountTextField.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -164),
            amountTextField.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
