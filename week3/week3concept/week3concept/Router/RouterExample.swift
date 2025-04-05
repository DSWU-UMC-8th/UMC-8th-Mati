//
//  RouterExample.swift
//  week3concept
//
//  Created by 김미주 on 4/6/25.
//

import SwiftUI

struct RouterExample: View {
    @State private var router = NavigationRouter()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            VStack {
                Button("Go to Home") {
                    router.push(.home)
                }
                
                Button("Go to Detail") {
                    router.push(.profile(userID: 123))
                }
                
                Button("Go to Profile") {
                    router.push(.profile(userID: 123))
                }
                
                Button("Reset Navigation") {
                    router.reset()
                }
            }
            .navigationDestination(for: Route.self) { route in
                switch route {
                case .home:
                    RouteHomeView()
                case .detail(let title):
                    RouteDetailView(title: title)
                case .profile(let userID):
                    RouteProfileView(userID: userID)
                }
            }
            .navigationTitle("Home")
        }
    }
}

struct RouteHomeView: View {
    var body: some View {
        VStack {
            Text("my home!!!")
        }
    }
}


struct RouteDetailView: View {
    let title: String

    var body: some View {
        VStack {
            Text("This is \(title) View")
                .font(.largeTitle)
        }
        .navigationTitle(title)
    }
}

struct RouteProfileView: View {
    let userID: Int

    var body: some View {
        VStack {
            Text("User ID: \(userID)")
                .font(.largeTitle)
        }
        .navigationTitle("Profile")
    }
}

#Preview {
    RouterExample()
}
