//
//  Route.swift
//  week3concept
//
//  Created by 김미주 on 4/6/25.
//

import Foundation
import SwiftUI

enum Route: Hashable {
    case home
    case detail(title: String)
    case profile(userID: Int)
}
