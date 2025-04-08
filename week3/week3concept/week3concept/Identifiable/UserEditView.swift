//
//  UserEditView.swift
//  week3concept
//
//  Created by 김미주 on 4/2/25.
//

import SwiftUI

struct UserEditView: View {
    @Binding var user: User
    
    var body: some View {
        Form {
            TextField("Name", text: $user.name)
            Stepper("Age: \(user.age)", value: $user.age, in: 18...100)
        }
    }
}
