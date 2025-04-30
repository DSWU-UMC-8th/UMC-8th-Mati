//
//  ImageHandling.swift
//  week4concept
//
//  Created by 김미주 on 4/13/25.
//

import Foundation
import SwiftUI

protocol ImageHandling: AnyObject {
    func addImage(_ image: UIImage)
    func getImages() -> [UIImage]
    var recognizedText: String { get set }
}
