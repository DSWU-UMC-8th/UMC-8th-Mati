//
//  starbucksApp.swift
//  starbucks
//
//  Created by 김미주 on 3/22/25.
//

import SwiftUI

@main
struct starbucksApp: App {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false
    
    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                TabBar()
            } else {
                LoginView()
            }
        }
        .modelContainer(for: ReceiptModel.self)
    }
}
