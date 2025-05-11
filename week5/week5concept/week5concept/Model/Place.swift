//
//  Place.swift
//  week5concept
//
//  Created by 김미주 on 5/6/25.
//

import Foundation
import MapKit

struct Place: Identifiable, Hashable {
    let id = UUID()
    let mapItem: MKMapItem
}
