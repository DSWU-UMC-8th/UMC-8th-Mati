//
//  UserListView.swift
//  week3concept
//
//  Created by 김미주 on 4/2/25.
//

import SwiftUI

struct UserListView: View {
    @State private var userViewModel: UserViewModel = .init()
    
    @State private var selectedUser: User?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(userViewModel.users.indices, id: \.self) { index in
                    NavigationLink(destination: UserEditView(user: $userViewModel.users[index])) {
                        HStack {
                            Text(userViewModel.users[index].name)
                            Spacer()
                            Text("\(userViewModel.users[index].age) years old")
                        }
                    }
                }
            }
            .navigationTitle("Users")
        }
    }
}

#Preview {
    UserListView()
}
