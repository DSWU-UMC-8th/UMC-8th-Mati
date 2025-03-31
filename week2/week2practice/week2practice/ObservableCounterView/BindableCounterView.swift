//
//  BindableCounterView.swift
//  week2practice
//
//  Created by 김미주 on 3/26/25.
//

import SwiftUI
import Observation

@Observable
class Counter {
    var count = 0
}

struct BindableCounterView: View {
    private var counter = Counter()
    
    var body: some View {
        VStack {
            Text("Count: \(counter.count)")
            Button("Increment") {
                counter.count += 1
            }
            ChildView(counter: counter)
        }
    }
}

struct ChildView: View {
    @Bindable var counter: Counter

    var body: some View {
        Button("Child Increment") {
            counter.count += 1
        }
    }
}

#Preview {
    BindableCounterView()
}
