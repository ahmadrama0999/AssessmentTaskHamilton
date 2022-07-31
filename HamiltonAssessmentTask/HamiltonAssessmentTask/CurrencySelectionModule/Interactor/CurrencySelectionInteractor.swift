//
//  CurrencySelectionModel.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import Foundation

protocol CurrencySelectionInputInteractorProtocol {
    var presenter: CurrencySelectionOutputInteractorProtocol? {get set}
    func getModel()
}

protocol CurrencySelectionOutputInteractorProtocol: NSObject {
    func currencyDidFetch(model: CurrencySelectionModel)
}

class CurrencySelectionInteractor: CurrencySelectionInputInteractorProtocol {
    weak var presenter: CurrencySelectionOutputInteractorProtocol?
    
    func getModel() {
    }
}
