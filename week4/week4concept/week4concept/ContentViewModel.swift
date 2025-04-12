//
//  ContentViewModel.swift
//  week4concept
//
//  Created by 김미주 on 4/13/25.
//

import Foundation
import SwiftUI

@Observable
class ContentViewModel: ImageHandling {
    
    func addImage(_ images: UIImage) {
        self.images.append(images)
    }
    
    func removeImage(at index: Int) {
        guard !self.images.isEmpty else { return }
        self.images.remove(at: index)
    }
    
    func getImages() -> [UIImage] {
        self.images
    }
    
    var isImagePickerPresented: Bool = false
    
    internal var images: [UIImage] = []
    
}
