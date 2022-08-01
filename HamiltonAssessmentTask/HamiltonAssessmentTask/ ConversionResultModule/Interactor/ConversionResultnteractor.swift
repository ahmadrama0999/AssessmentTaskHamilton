//
//  ConversionResultInteractor.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import Foundation

protocol ConversionResultInputInteractorProtocol {
    var presenter: ConversionResultOutputInteractorProtocol? {get set}
    func getExchangeResult(model: ConversionModel)
}

protocol ConversionResultOutputInteractorProtocol {
    func currencyDidFetch(model:ConversionResultModel)
}

class ConversionResultInteractor: ConversionResultInputInteractorProtocol {
    
    var presenter: ConversionResultOutputInteractorProtocol?
    
    private let currencyNetworkClient: CurrencyNetworkProtocol
    
    init(currencyNetworkClient: CurrencyNetworkProtocol) {
        self.currencyNetworkClient = currencyNetworkClient
    }
    
    func getExchangeResult(model: ConversionModel) {
        currencyNetworkClient.fetchPairConversion(
            baseCurrency: model.baseCode,
            targetCurrency: model.targetCode,
            amount: model.currentAmount,
            completion: { [weak self] result in
                switch result {
                case let .success(model):
                    guard let model = model else {
                        return
                    }
                    self?.presenter?.currencyDidFetch(model: model)
                case let .failure(error):
                    // TODO: Create error handler
                    print(error)
                }
            })
    }
}
