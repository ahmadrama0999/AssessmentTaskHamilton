//
//  CurrencySelectionViewController.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import UIKit

protocol CurrencySelectionViewProtocol {
    var presenter: CurrencySelectionPresenterProtocol? { get set }

    func showCurrency(supportedCurrencyList: [String])
}

class CurrencySelectionViewController: UIViewController, CurrencySelectionViewProtocol {
    
    var presenter: CurrencySelectionPresenterProtocol?
    
    private let currentCurrencyView: CurrencyView = {
        let view = CurrencyView()
        return view
    }()
    
    private let targetCurrencyView: CurrencyView = {
        let view = CurrencyView()
        return view
    }()
    
    private let arrowImageView: UIImageView = {
        let image: UIImage = .convertArrow
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 2
        return stackView
    }()
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.text = Localization.amountWithColon
        label.textColor = .red
        label.numberOfLines = 1
        return label
    }()
    
    private let calculateButton: UIButton = {
        let button = CommonButoon()
        button.setTitle(Localization.calculate, for: [])
        return button
    }()
    
    private let amountTextField: UITextField = {
        let textField = UnderlinedTextField(lineWidth: 2, lineColor: .lightGray)
        textField.placeholder = Localization.amountDefaultPlaceholder
        textField.textAlignment = .center
        textField.font = .boldSystemFont(ofSize: 48)
        textField.keyboardType = .numberPad
        return textField
    }()
    
    private var currencyList: [String] = []
    private var currentSelectedCurrency: String? {
        willSet {
            currentCurrencyView.currencyLabel.text = newValue
        }
    }
    private var targetSelectedCurrency: String? {
        willSet {
            targetCurrencyView.currencyLabel.text = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        [currentCurrencyView, arrowImageView, targetCurrencyView].forEach(horizontalStackView.addArrangedSubview)
        
        NSLayoutConstraint.activate([
            arrowImageView.widthAnchor.constraint(equalToConstant: 12)
        ])
        
        view.addSubview(horizontalStackView, constraints: [
            horizontalStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 32),
            horizontalStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -32),
            horizontalStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64)
        ])
        
        view.addSubview(calculateButton, constraints: [
            calculateButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 32),
            calculateButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -32),
            calculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -64),
            calculateButton.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        view.addSubview(amountTextField, constraints: [
            amountTextField.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 32),
            amountTextField.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -32),
            amountTextField.bottomAnchor.constraint(equalTo: calculateButton.topAnchor, constant: -164),
            amountTextField.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        view.addSubview(amountLabel, constraints: [
            amountLabel.leftAnchor.constraint(equalTo: amountTextField.leftAnchor),
            amountLabel.bottomAnchor.constraint(equalTo: amountTextField.topAnchor, constant: -16),
            amountLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        presenter?.getCurrency()
        createPickerView()
        addKeyboardHandler()
    }
    
    private func addKeyboardHandler() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func createPickerView() {
        
        currentCurrencyView.didTap = {
            let popupPickerView = PopupPickerView()
            popupPickerView.display(itemTitles: self.currencyList, doneHandler: {
                let selectedIndex = popupPickerView.pickerView.selectedRow(inComponent: 0)
                self.currentSelectedCurrency = self.currencyList[selectedIndex]
            })
        }
        
        targetCurrencyView.didTap = {
            let popupPickerView = PopupPickerView()
            popupPickerView.display(itemTitles: self.currencyList, doneHandler: {
                let selectedIndex = popupPickerView.pickerView.selectedRow(inComponent: 0)
                self.targetSelectedCurrency = self.currencyList[selectedIndex]
            })
        }
    }
    
    func showCurrency(supportedCurrencyList: [String]) {
        currencyList = supportedCurrencyList
        currentSelectedCurrency = currencyList.first
        targetSelectedCurrency = currencyList.first
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}
