//
//  CurrencySelectionPresenter.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import Foundation

protocol CurrencySelectionPresenterProtocol {
    var interactor: CurrencySelectionInputInteractorProtocol? {get set}
    var view: CurrencySelectionViewProtocol? {get set}
    var router: CurrencySelectionRouterProtocol? {get set}
    
    func getCurrency()
}

class CurrencySelectionPresenter: CurrencySelectionPresenterProtocol {
    var interactor: CurrencySelectionInputInteractorProtocol?
    var view: CurrencySelectionViewProtocol?
    var router: CurrencySelectionRouterProtocol?
    
    func getCurrency() {
        interactor?.getSupportedCurrencies()
    }
    
}

extension CurrencySelectionPresenter: CurrencySelectionOutputInteractorProtocol {
    func currencyDidFetch(list: [String]) {
        view?.showCurrency(supportedCurrencyList: list)
    }
    
}
