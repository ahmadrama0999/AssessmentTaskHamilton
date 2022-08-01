//
//  SuccessPresenter.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 01.08.2022.
//

import UIKit

protocol SuccessPresenterProtocol {
    var view: SuccessViewProtocol? { get set }
    var router: SuccessRouterProtocol? { get set }
    var model: SuccessModel { get set }
    
    func returnToStart(rootViewController: UIViewController)
    func viewDidLoad()
}

class SuccessPresenter: SuccessPresenterProtocol {
    var model: SuccessModel
    var view: SuccessViewProtocol?
    var router: SuccessRouterProtocol?
    
    init(model: SuccessModel) {
        self.model = model
    }
    
    func viewDidLoad() {
        view?.setSuccessMessage(currency: model.targetCurrency, amount: model.conversionResult.description)
    }
    
    func returnToStart(rootViewController: UIViewController) {
        router?.backToStart(rootViewController: rootViewController)
    }
}
