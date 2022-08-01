//
//  CurrencySelectionRouter.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import Foundation
import UIKit

protocol ConversionResultRouterProtocol {
    
    static func createConversionResultModule(
        selectedCurrency: String,
        targetCurrency: String,
        amount: Double
    ) -> UIViewController
    
    func showSuccessModule(
        targetCurrency: String,
        conversionResult: Double,
        rootViewController: UIViewController
    )
}

class ConversionResultRouter: ConversionResultRouterProtocol {
    static func createConversionResultModule(
        selectedCurrency: String,
        targetCurrency: String,
        amount: Double
    ) -> UIViewController {
        let currencyNetworkClient = CurrencyNetworkClient()
        let viewController = ConversionResultViewController()
        let presenter = ConversionResultPresenter(model: ConversionModel(
            baseCode: selectedCurrency,
            targetCode: targetCurrency,
            currentAmount: amount,
            converisonAmount: nil
        ))
        let interactor = ConversionResultInteractor(currencyNetworkClient: currencyNetworkClient)
        let router = ConversionResultRouter()
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewController
        presenter.router = router
        interactor.presenter = presenter
        
        return viewController
    }
    
    func showSuccessModule(
        targetCurrency: String,
        conversionResult: Double,
        rootViewController: UIViewController
    ) {
        let successViewController = SuccessRouter.createSuccessModule(
            targetCurrency: targetCurrency,
            conversionResult: conversionResult
        )
        rootViewController.navigationController?.pushViewController(successViewController, animated: true)
    }
}
