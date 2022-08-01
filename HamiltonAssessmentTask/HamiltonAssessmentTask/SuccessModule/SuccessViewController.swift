//
//  SuccessViewController.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 01.08.2022.
//

import UIKit

protocol SuccessViewProtocol {
    var presenter: SuccessPresenterProtocol? { get set }
    
    func setSuccessMessage(currency: String, amount: String)
}

class SuccessViewController: UIViewController, SuccessViewProtocol {
    var presenter: SuccessPresenterProtocol?
    
    private let imageView: UIImageView = {
        let image = UIImage.success
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let successMessageLabel: UILabel = {
       let label = UILabel()
        label.numberOfLines = 0
        label.font = .boldSystemFont(ofSize: 16)
        label.text = "YOUR MONEY"
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureNavigationController()
        presenter?.viewDidLoad()
        
        view.addSubview(imageView, constraints: [
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        view.addSubview(successMessageLabel, constraints: [
            successMessageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            successMessageLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 32),
            successMessageLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -32)
        ])
    }
    
    func setSuccessMessage(currency: String, amount: String) {
        successMessageLabel.text = Localization.successMessage(currency: currency, amount: amount)
    }
    
    private func configureNavigationController() {
        navigationItem.setHidesBackButton(true, animated: true)
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            systemItem: .done,
            primaryAction: UIAction(handler: { [weak self] _ in
                guard let self = self else {
                    return
                }
                self.presenter?.returnToStart(rootViewController: self)
            }),
            menu: nil)
    }
}
