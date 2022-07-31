//
//  MyControl.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 31.07.2022.
//

import UIKit

class MyControl: UIControl {
    
    var didTap: (() -> Void)? {
        didSet { addTarget() }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        sendActions(for: .touchUpInside)
    }
    
    private func addTarget() {
        addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
    @objc private func tapAction() {
        didTap?()
    }
}
