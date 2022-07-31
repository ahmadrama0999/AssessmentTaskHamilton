//
//  CurrencySelectionModel.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import Foundation

protocol CurrencySelectionInputInteractorProtocol {
    var presenter: CurrencySelectionOutputInteractorProtocol? {get set}
    func getSupportedCurrencies()
}

protocol CurrencySelectionOutputInteractorProtocol {
    func currencyDidFetch(list: [String])
}

class CurrencySelectionInteractor: CurrencySelectionInputInteractorProtocol {
    var presenter: CurrencySelectionOutputInteractorProtocol?
    private let currencyNetworkClient: CurrencyNetworkProtocol
    
    init(currencyNetworkClient: CurrencyNetworkProtocol) {
        self.currencyNetworkClient = currencyNetworkClient
    }
    
    func getSupportedCurrencies() {
        presenter?.currencyDidFetch(list: ["EUR", "USD", "BGP", "AUD"])
    }
}
