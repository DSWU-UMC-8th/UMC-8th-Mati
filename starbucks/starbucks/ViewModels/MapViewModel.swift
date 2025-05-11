//
//  MapViewModel.swift
//  starbucks
//
//  Created by 김미주 on 5/6/25.
//

import SwiftUI
import MapKit
import Observation

@Observable
final class MapViewModel {
    
    var cameraPosition: MapCameraPosition = .userLocation(fallback: .automatic)
    var currentMapCenter: CLLocationCoordinate2D?
    
    var stores: [Store] = []
}
