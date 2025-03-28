//
//  ConnectedScenesView.swift
//  week2practice
//
//  Created by 김미주 on 3/29/25.
//

import SwiftUI

struct ConnectedScenesView: View {
    
    var screenSize: CGRect {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .zero
        }
        return windowScene.screen.bounds
    }
    
    var body: some View {
        VStack {
            Text("Screen Width: \(screenSize.width)")
            Text("Screen Height: \(screenSize.height)")
        }
    }
}

#Preview {
    ConnectedScenesView()
}
