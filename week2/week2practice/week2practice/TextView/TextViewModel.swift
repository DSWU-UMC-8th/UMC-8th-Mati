//
//  TextViewModel.swift
//  week2practice
//
//  Created by 김미주 on 3/26/25.
//

import SwiftUI

class TextViewModel: ObservableObject {
    @Published var inputText: String = ""
    
    init() {
        print("✅ 새로운 TextViewModel 인스턴스 생성됨! ✅")
    }
}
