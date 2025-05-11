//
//  OrderSheet.swift
//  starbucks
//
//  Created by 김미주 on 5/6/25.
//

import SwiftUI

struct OrderSheet: View {
    @State private var viewModel = StoreViewModel()
    @State private var locationManager = LocationManager.shared

    @Binding var searchText: String
    @State private var selectedSegment: OrderSheetSegment = .near
    @State private var showMap = false
    
    var body: some View {
        VStack(spacing: 0) {
            topNavigationBar
            
            Spacer().frame(height: 22)
            
            segmentBar
            
            if showMap {
                OrderStoreMapView()
            } else {
                storeList
            }
        }
        .task {
            viewModel.loadStores()

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                if let current = locationManager.currentLocation {
                    print("현재 위치: \(current.coordinate.latitude), \(current.coordinate.longitude)")
                    viewModel.userLocation = current
                    viewModel.updateDistances()
                } else {
                    print("위치 정보 없음")
                }
            }
        }
    }
    
    private var topNavigationBar: some View {
        VStack(spacing: 24) {
            Capsule(style: .circular)
                .fill(.gray04)
                .frame(width: 70, height: 4)
                .padding(.top, 11)
            
            ZStack(alignment: .trailing) {
                Text("매장 설정")
                    .font(.MainTextMedium16)
                    .frame(maxWidth: .infinity)
                Button(action: {
                    showMap.toggle()
                }) {
                    Image(.iconMap)
                }
            }
            .padding(.horizontal, 32.5)
            
            searchView
        }
    }
    
    private var searchView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(.gray08)
                .frame(height: 27)
            
            TextField("검색", text: $searchText)
                .font(.MainTextSemiBold13)
                .textInputAutocapitalization(.never)
                .padding(.horizontal, 7)
        }
        .padding(.horizontal, 32.5)
    }
    
    private var segmentBar: some View {
        VStack(alignment: .leading, spacing: 17) {
            HStack(spacing: 20) {
                ForEach(OrderSheetSegment.allCases, id: \.self) { segment in
                    Button(action: {
                        selectedSegment = segment
                    }) {
                        HStack(spacing: 1) {
                            Text(segment.rawValue)
                                .font(selectedSegment == segment ?  .MainTextSemiBold13 : .MainTextRegular13)
                                .foregroundStyle(selectedSegment == segment ? .black03 : .gray03)
                        }
                    }
                }
            }
            Divider()
        }
        .padding(.horizontal, 32.5)
    }
    
    private var storeList: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 16) {
                ForEach(viewModel.stores) { store in
                    StoreItem(store: store)
                }
            }
            .padding(.vertical, 19)
        }
    }
}

#Preview {
    OrderSheet(searchText: .constant(""))
}
