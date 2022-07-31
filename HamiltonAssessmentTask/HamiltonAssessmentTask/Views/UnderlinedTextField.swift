//
//  UnderlinedTextField.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import UIKit

class UnderlinedTextField: UITextField {
    private let lineWidth: CGFloat
    private let lineColor: UIColor
    
    init(lineWidth: CGFloat, lineColor: UIColor) {
        self.lineWidth = lineWidth
        self.lineColor = lineColor
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let height = self.bounds.height
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setStrokeColor(lineColor.cgColor)
            context.setLineWidth(lineWidth)
            context.beginPath()
            context.move(to: CGPoint(x: self.bounds.origin.x, y: height - lineWidth))
            context.addLine(to: CGPoint(x: self.bounds.size.width, y: height - lineWidth))
            context.closePath()
            context.strokePath()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

