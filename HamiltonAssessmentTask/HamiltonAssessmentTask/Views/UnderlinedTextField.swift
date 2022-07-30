//
//  UnderlinedTextField.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import UIKit

class UnderlinedTextField: UITextField {
    private let lineWidth: CGFloat = 2
    
    override func draw(_ rect: CGRect) {
        let height = self.bounds.height
        
        if let context = UIGraphicsGetCurrentContext() {
            context.setStrokeColor(UIColor.black.cgColor)
            context.setLineWidth(lineWidth)
            context.beginPath()
            context.move(to: CGPoint(x: self.bounds.origin.x, y: height - lineWidth))
            context.addLine(to: CGPoint(x: self.bounds.size.width, y: height - lineWidth))
            context.closePath()
            context.strokePath()
        }
    }
}

