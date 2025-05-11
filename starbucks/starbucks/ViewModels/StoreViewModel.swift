//
//  StoreViewModel.swift
//  starbucks
//
//  Created by 김미주 on 5/6/25.
//

import Foundation
import CoreLocation
import SwiftUI

@Observable
class StoreViewModel {
    var stores: [Store] = []
    var userLocation: CLLocation?
    
    func loadStores() {
        guard let url = Bundle.main.url(forResource: "starbucks_data", withExtension: "geojson") else {
            print("파일 찾을 수 없음")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(StarbucksModel.self, from: data)
            self.stores = decoded.features.map { feature in
                var store = feature.properties
                let coords = feature.geometry.coordinates
                store.longitude = coords[0]
                store.latitude = coords[1]
                return store
            }
            print("디코딩 성공")
        } catch {
            print("디코딩 실패")
        }
    }
    
    func updateDistances() {
        guard let location = userLocation else { return }

        stores = stores.map { store in
            var updated = store
            updated.distance = calculateDistance(from: location, to: store)
            return updated
        }.sorted { ($0.distance ?? .greatestFiniteMagnitude) < ($1.distance ?? .greatestFiniteMagnitude) }
    }

    private func calculateDistance(from: CLLocation, to store: Store) -> Double? {
        guard let lat = store.latitude, let lon = store.longitude else { return nil }
        let storeLocation = CLLocation(latitude: lat, longitude: lon)
        return from.distance(from: storeLocation) / 1000
    }
}
