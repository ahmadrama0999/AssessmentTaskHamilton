//
//  SuccessRouter.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 01.08.2022.
//

import Foundation

import UIKit

protocol SuccessRouterProtocol {
    
    static func createSuccessModule(
        targetCurrency: String,
        conversionResult: Double
    ) -> UIViewController
    
    func backToStart(rootViewController: UIViewController)
}

class SuccessRouter: SuccessRouterProtocol {
    static func createSuccessModule(
        targetCurrency: String,
        conversionResult: Double
    ) -> UIViewController {
        let viewController = SuccessViewController()
        let presenter = SuccessPresenter(model: SuccessModel(targetCurrency: targetCurrency, conversionResult: conversionResult))
        let router = SuccessRouter()
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.router = router
        
        return viewController
    }
    
    func backToStart(rootViewController: UIViewController) {
        rootViewController.navigationController?.popToRootViewController(animated: true)
    }
}

