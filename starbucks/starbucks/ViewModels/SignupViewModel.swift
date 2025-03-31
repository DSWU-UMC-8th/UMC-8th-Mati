//
//  SignupViewModel.swift
//  starbucks
//
//  Created by 김미주 on 3/29/25.
//

import Foundation
import SwiftUI

class SignupViewModel {
    var user = SignupModel(nickname: "", email: "", password: "")
    
    @AppStorage("nickname") private var apNickname: String = ""
    @AppStorage("email") private var apEmail: String = ""
    @AppStorage("password") private var apPassword: String = ""
    
    func saveUserData() {
        apNickname = user.nickname
        apEmail = user.email
        apPassword = user.password
    }
}
