//
//  CommonButton.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import UIKit

class CommonButoon: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .red
        titleLabel?.font = .boldSystemFont(ofSize: 18)
        titleLabel?.textColor = .white
        layer.cornerRadius = 8
    }
}
