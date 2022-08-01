//
//  CurrencySelectionViewController.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import UIKit

protocol ConversionResultViewProtocol {
    var presenter: ConversionResultPresenterProtocol? { get set }

    func showConversionResult(selectedCurrency: String, selectedCurrencyAmount: String, targetCurrency: String, targetCurrencyAmount: String)
}

class ConversionResultViewController: UIViewController, ConversionResultViewProtocol {
    
    var presenter: ConversionResultPresenterProtocol?
    private var seconds = 30
    private var timer: Timer?
    
    private let verticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    private var currentCurrencyLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 32)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private var targetCurrencyLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 32)
        label.textColor = .black
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private var versusLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 1
        label.text = "Presedes"
        return label
    }()
    
    private var timerLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .lightGray
        label.textAlignment = .center
        label.numberOfLines = 1
        return label
    }()
    
    private let convertButton: UIButton = {
        let button = CommonButoon()
        button.setTitle("Convert", for: [])
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        [currentCurrencyLabel, versusLabel, targetCurrencyLabel].forEach(verticalStackView.addArrangedSubview)
        
        view.addSubview(verticalStackView, constraints: [
            verticalStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 32),
            verticalStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -32),
            verticalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64)
        ])
        
        view.addSubview(convertButton, constraints: [
            convertButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 32),
            convertButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -32),
            convertButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            convertButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(timerLabel, constraints: [
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.bottomAnchor.constraint(equalTo: convertButton.topAnchor, constant: -8)
        ])
        
        presenter?.getExchangeResult()
        convertButton.addTarget(self, action: #selector(convertButtomAction), for: .touchUpInside)
    }
    
    @objc func convertButtomAction() {
        presenter?.showSuccessModule(rootViewController: self)
    }
    
    func showConversionResult(
        selectedCurrency: String,
        selectedCurrencyAmount: String,
        targetCurrency: String,
        targetCurrencyAmount: String
    ) {
        DispatchQueue.main.async { [weak self] in
            self?.currentCurrencyLabel.text = selectedCurrencyAmount + " " + selectedCurrency
            self?.targetCurrencyLabel.text = targetCurrencyAmount + " " + targetCurrency
            self?.startCountdown()
        }
    }
    
    private func startCountdown() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            self?.seconds -= 1
            if self?.seconds == 0 {
                timer.invalidate()
            } else if let seconds = self?.seconds {
                self?.timerLabel.text = seconds.description + "sec left"
            }
        }
    }
    
    deinit {
        timer?.invalidate()
    }
}
