//
//  View+Extensions.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import UIKit

extension UIView {
    func addSubview(_ view: UIView, constraints: [NSLayoutConstraint]) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
}

extension UIView {
    private struct TapClosureHolder {
        static var _closure:()->() = {}
    }

    private var tapClosure: () -> () {
        get { return TapClosureHolder._closure }
        set { TapClosureHolder._closure = newValue }
    }

    func tapClosure(closure: @escaping ()->()) {
        self.tapClosure = closure

        isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(onClickAction))
        addGestureRecognizer(tap)
    }

    @objc private func onClickAction() {
        tapClosure()
    }
}

