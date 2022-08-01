//
//  UIWindow+Extensions.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 31.07.2022.
//

import UIKit

extension UIWindow {
    static var keyWindow: UIWindow? {
        var keyWindow: UIWindow?
        if #available(iOS 13, *) {
            keyWindow = UIApplication.shared.connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first(where: { $0.isKeyWindow })
        } else {
            keyWindow = UIApplication.shared.keyWindow
        }
        return keyWindow
    }
}
