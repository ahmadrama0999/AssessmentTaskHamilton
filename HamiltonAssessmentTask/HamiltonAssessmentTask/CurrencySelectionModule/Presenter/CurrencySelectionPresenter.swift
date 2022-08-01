//
//  CurrencySelectionPresenter.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import Foundation
import UIKit

protocol CurrencySelectionPresenterProtocol {
    var interactor: CurrencySelectionInputInteractorProtocol? {get set}
    var view: CurrencySelectionViewProtocol? {get set}
    var router: CurrencySelectionRouterProtocol? {get set}
    
    func getCurrency()
    func showConversionResultModule(
        selectedCurrency: String,
        targetCurrency: String,
        amount: Double,
        rootViewController: UIViewController
    )
}

class CurrencySelectionPresenter: CurrencySelectionPresenterProtocol {
    
    var interactor: CurrencySelectionInputInteractorProtocol?
    var view: CurrencySelectionViewProtocol?
    var router: CurrencySelectionRouterProtocol?
    
    func getCurrency() {
        interactor?.getSupportedCurrencies()
    }
    
    func showConversionResultModule(
        selectedCurrency: String,
        targetCurrency: String,
        amount: Double,
        rootViewController: UIViewController
    ) {
        router?.showConversionResultModule(
            selectedCurrency: selectedCurrency,
            targetCurrency: targetCurrency,
            amount: amount,
            rootViewController: rootViewController
        )
    }
}

extension CurrencySelectionPresenter: CurrencySelectionOutputInteractorProtocol {
    func currencyDidFetch(list: [String]) {
        view?.showCurrency(supportedCurrencyList: list)
    }
    
}
