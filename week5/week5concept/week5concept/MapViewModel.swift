//
//  MapViewModel.swift
//  week5concept
//
//  Created by 김미주 on 5/5/25.
//

import SwiftUI
import MapKit
import Observation

@Observable
final class MapViewModel {
    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    var currentMapCenter: CLLocationCoordinate2D?
    
    var searchResults: [Place] = []
    
    // Marker
    var markers: [Marker] = [
        .init(coordinate: .init(latitude: 37.653115, longitude: 126.842882), title: "원당역"),
        .init(coordinate: .init(latitude: 37.649644, longitude: 126.834534), title: "어울림누리")
    ]
    
    // Geofence
    let geofenceCoordinate = CLLocationCoordinate2D(latitude: 37.653246, longitude: 127.016263) // 덕성여대
    let geofenceRadius: CLLocationDistance = 1000
    let geofenceIdentifier = "덕성여대"
    
    init() {
        LocationManager.shared.startMonitoringGeofence(center: geofenceCoordinate, radius: geofenceRadius, identifier: geofenceIdentifier)
    }
    
    func search(query: String, to locaation: CLLocation) {
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query
        request.region = .init(center: locaation.coordinate, span: .init(latitudeDelta: 0.05, longitudeDelta: 0.05))
        
        let search = MKLocalSearch(request: request)
        search.start { [weak self] response, error in
            guard let self, let mapItems = response?.mapItems else { return }
            
            DispatchQueue.main.async {
                self.searchResults = mapItems.map { Place(mapItem: $0) }
            }
        }
    }
}
