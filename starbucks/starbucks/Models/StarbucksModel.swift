//
//  StarbucksModel.swift
//  starbucks
//
//  Created by 김미주 on 5/6/25.
//

import Foundation
import CoreLocation

struct StarbucksModel: Codable {
    let features: [StoreFeature]
}

struct StoreFeature: Codable {
    let properties: Store
    let geometry: Geometry
}

struct Geometry: Codable {
    let coordinates: [Double]
}

struct Store: Identifiable, Codable {
    var id = UUID()
    let name: String
    let address: String
    let category: String
    var latitude: Double?
    var longitude: Double?
    var distance: Double? = nil

    enum CodingKeys: String, CodingKey {
        case name = "Sotre_nm"
        case address = "Address"
        case category = "Category"
    }
}
