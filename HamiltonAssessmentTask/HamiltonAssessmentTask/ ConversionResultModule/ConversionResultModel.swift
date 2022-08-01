//
//  ConversionModel.swift
//  HamiltonAssessmentTask
//
//  Created by Ramin Akhmad on 31.07.2022.
//

import Foundation

struct ConversionModel {
    let baseCode: String
    let targetCode: String
    let currentAmount: Double
    let converisonAmount: Double?
}

struct ConversionResultModel: Codable {
    let baseCode:String
    let targetCode: String
    let conversionRate: Double?
    let conversionResult: Double?
    
    enum CodingKeys: String, CodingKey {
        case baseCode = "base_code"
        case targetCode = "target_code"
        case conversionRate = "conversion_rate"
        case conversionResult = "conversion_result"
    }
}
