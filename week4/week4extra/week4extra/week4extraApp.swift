//
//  week4extraApp.swift
//  week4extra
//
//  Created by 김미주 on 4/9/25.
//

import SwiftUI
import SwiftData

@main
struct week4extraApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Task.self)
    }
}
