//
//  CurrencySelectionPresenter.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import Foundation
import UIKit

protocol ConversionResultPresenterProtocol {
    var interactor: ConversionResultInputInteractorProtocol? {get set}
    var view: ConversionResultViewProtocol? {get set}
    var router: ConversionResultRouterProtocol? {get set}
    var model: ConversionModel { get set }
    
    func getExchangeResult()
    func showSuccessModule(rootViewController: UIViewController)
}

class ConversionResultPresenter: ConversionResultPresenterProtocol {
    var interactor: ConversionResultInputInteractorProtocol?
    var view: ConversionResultViewProtocol?
    var router: ConversionResultRouterProtocol?
    var model: ConversionModel
    
    init(model: ConversionModel) {
        self.model = model
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getExchangeResult() {
        interactor?.getExchangeResult(model: model)
    }
    
    func showSuccessModule(rootViewController: UIViewController) {
        guard let conversionResult = model.converisonAmount else {
            return
        }
        router?.showSuccessModule(
            targetCurrency: model.targetCode,
            conversionResult: conversionResult,
            rootViewController: rootViewController
        )
    }
    
}

extension ConversionResultPresenter: ConversionResultOutputInteractorProtocol {
    func currencyDidFetch(model: ConversionResultModel) {
        self.model = .init(
            baseCode: model.baseCode,
            targetCode: model.targetCode,
            currentAmount: self.model.currentAmount,
            converisonAmount: model.conversionResult
        )
        
        guard let conversionAmount = self.model.converisonAmount else {
            return
        }
        
        view?.showConversionResult(
            selectedCurrency: model.baseCode,
            selectedCurrencyAmount: String(self.model.currentAmount),
            targetCurrency: model.targetCode,
            targetCurrencyAmount: String(conversionAmount)
        )
    }
}
