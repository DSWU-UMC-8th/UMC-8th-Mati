//
//  LoginViewModel.swift
//  starbucks
//
//  Created by 김미주 on 3/23/25.
//

import Foundation

class LoginViewModel: ObservableObject {
    @Published var id: String = ""
    @Published var password: String = ""
}

