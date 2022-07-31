//
//  CurrencySelectionRouter.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import Foundation
import UIKit

protocol CurrencySelectionRouterProtocol {
    
    static func createCurrencySelectionModule() -> UIViewController
}

class CurrencySelectionRouter: CurrencySelectionRouterProtocol {
    static func createCurrencySelectionModule() -> UIViewController {
        let currencyNetworkClient = CurrencyNetworkClient()
        let viewController = CurrencySelectionViewController()
        let presenter = CurrencySelectionPresenter()
        let interactor = CurrencySelectionInteractor(currencyNetworkClient: currencyNetworkClient)
        let router = CurrencySelectionRouter()
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewController
        presenter.router = router
        interactor.presenter = presenter
        
        return viewController
    }
    
    
}
