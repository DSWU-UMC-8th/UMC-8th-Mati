//
//  Marker.swift
//  week5concept
//
//  Created by 김미주 on 5/5/25.
//

import Foundation
import MapKit

struct Marker: Identifiable {
    let id = UUID()
    let coordinate: CLLocationCoordinate2D
    let title: String
}
