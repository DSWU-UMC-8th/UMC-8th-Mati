//
//  ObservableCounterView.swift
//  week2practice
//
//  Created by 김미주 on 3/26/25.
//

import SwiftUI

struct ObservableCounterView: View {
    var viewModel: ObservableCounterViewModel = .init()
    
    var body: some View {
        VStack {
            
            Text("\(viewModel.count)")
            
            Button(action: {
                viewModel.count += 1
            }, label: {
                Text("카운트 증가합니다.")
            })
        }
        .padding()
    }
}

#Preview {
    ObservableCounterView()
}
