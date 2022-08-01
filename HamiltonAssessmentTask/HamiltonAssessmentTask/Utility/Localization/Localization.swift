//
//  Localization.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 30.07.2022.
//

import Foundation

enum Localization {
    static let calculate = "calculate".localized
    static let amountWithColon = "amount_with_сolon".localized
    static let amountDefaultPlaceholder = "amount_default_placegolder".localized
    static func successMessage(currency: String, amount: String) -> String {
        let localizedString = "success_message".localized
        return String(format: localizedString, currency, amount)
    }
}
