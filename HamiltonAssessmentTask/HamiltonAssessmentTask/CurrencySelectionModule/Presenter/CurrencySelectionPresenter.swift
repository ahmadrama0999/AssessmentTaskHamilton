//
//  CurrencySelectionPresenter.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import Foundation

protocol CurrencySelectionPresenterProtocol: NSObject {
    var interactor: CurrencySelectionInputInteractorProtocol? {get set}
    var view: CurrencySelectionViewProtocol? {get set}
    var wireframe: CurrencySelectionRouterProtocol? {get set}
}

class CurrencySelectionPresenter {
}
