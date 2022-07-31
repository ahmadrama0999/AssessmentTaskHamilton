//
//  CurrencyView.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import UIKit

class CurrencyView: MyControl {
    let currencyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 24)
        label.numberOfLines = 1
        return label
    }()
    
    let arrowImageView: UIImageView = {
        let image: UIImage = .downArrow
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.axis = .horizontal
        stackView.spacing = 2
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.borderWidth = 2
        layer.borderColor = UIColor.gray.cgColor
        
        [currencyLabel, arrowImageView].forEach(horizontalStackView.addArrangedSubview)
               
        NSLayoutConstraint.activate([
            arrowImageView.heightAnchor.constraint(equalToConstant: 24),
            arrowImageView.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        addSubview(horizontalStackView, constraints: [
            horizontalStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            horizontalStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            horizontalStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            horizontalStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
