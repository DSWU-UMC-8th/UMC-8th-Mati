//
//  SuccessISBNView.swift
//  week6practice
//
//  Created by 김미주 on 5/13/25.
//

import SwiftUI

struct SuccessISBNView: View {
    @Bindable var viewModel: ISBNScannerViewModel
    
    init(viewModel: ISBNScannerViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SuccessISBNView()
}
