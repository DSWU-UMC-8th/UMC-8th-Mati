//
//  OrderStoreMapView.swift
//  starbucks
//
//  Created by 김미주 on 5/6/25.
//

import SwiftUI
import MapKit

struct OrderStoreMapView: View {
    @Bindable private var locationManager = LocationManager.shared
    @Bindable private var storeViewModel: StoreViewModel = .init()
    @Bindable private var mapViewModel: MapViewModel = .init()
    
    @Namespace var mapScope
    
    @State private var nearbyStores: [Store] = []
    @State private var hasDraggedMap = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Map(position: $mapViewModel.cameraPosition, scope: mapScope) {
                UserAnnotation(anchor: .center)
                
                ForEach(nearbyStores, id: \.id) { store in
                    if let lat = store.latitude, let lon = store.longitude {
                        Annotation(store.name, coordinate: CLLocationCoordinate2D(latitude: lat, longitude: lon)) {
                            Image(.iconStarbucksPin)
                        }
                    }
                }
            }
            
            if hasDraggedMap {
                Button {
                    if let center = mapViewModel.currentMapCenter {
                        let centerLocation = CLLocation(latitude: center.latitude, longitude: center.longitude)
                        storeViewModel.userLocation = centerLocation
                        storeViewModel.updateDistances()

                        nearbyStores = storeViewModel.stores.filter {
                            ($0.distance ?? .greatestFiniteMagnitude) <= 10
                        }
                    }
                } label: {
                    Text("이 지역 검색")
                        .font(.MainTextMedium13)
                        .foregroundStyle(.gray06)
                        .padding(.horizontal, 14.5)
                        .padding(.vertical, 10)
                        .background(.white)
                        .clipShape(Capsule())
                        .shadow(color: .black.opacity(0.2), radius: 5, x: 0, y: 3)
                }
                
                .padding(.top, 22)
            }
        }
        .mapScope(mapScope)
        .task {
            storeViewModel.loadStores()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if let current = locationManager.currentLocation {
                    mapViewModel.cameraPosition = .region(MKCoordinateRegion(
                        center: current.coordinate,
                        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
                    ))
                    storeViewModel.userLocation = current
                    storeViewModel.updateDistances()

                    // 거리 10km 이내만 필터링
                    self.nearbyStores = storeViewModel.stores.filter {
                        ($0.distance ?? .greatestFiniteMagnitude) <= 10
                    }
                }
            }
        }
    }
}

#Preview {
    OrderStoreMapView()
}
