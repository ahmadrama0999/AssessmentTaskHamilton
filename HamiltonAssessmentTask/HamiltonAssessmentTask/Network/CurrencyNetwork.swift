//
//  CurrencyNetwork.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 31.07.2022.
//

import Foundation

protocol CurrencyNetworkProtocol {
    var apiKey: String { get }
    var mainURL: String { get }
    func fetchPairConversion(baseCurrency: String, targetCurrency: String, amount: Double, completion: @escaping (Result<ConversionModel?, Error>) -> Void)
}

class CurrencyNetworkClient: NetworkClient, CurrencyNetworkProtocol {
    
    private enum RequestType {
        /**
         Then need to add pair of currencies, for example /GBP/EUR
         Could also supply an optional AMOUNT variable /AMOUNT
         */
        static let pair = "pair/"
        /**
         Then need to add currency, for example /GBP
         */
        static let latest = "latest/"
    }
    
    let apiKey = "2eef1405ef2acbf949238745"
    let mainURL = "https://v6.exchangerate-api.com/v6/"
    
    func fetchPairConversion(baseCurrency: String, targetCurrency: String, amount: Double, completion: @escaping (Result<ConversionModel?, Error>) -> Void) {
        let urlString = mainURL + apiKey + RequestType.pair + baseCurrency + "/" + targetCurrency + "/" + amount.description
        request(type: ConversionModel.self, urlString: urlString, completion: { result in
            completion(result)
        })
    }
}
