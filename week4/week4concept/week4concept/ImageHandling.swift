//
//  ImageHandling.swift
//  week4concept
//
//  Created by 김미주 on 4/13/25.
//

import Foundation
import SwiftUI

protocol ImageHandling: AnyObject {
    func addImage(_ images: UIImage)
    func removeImage(at index: Int)
    func getImages() -> [UIImage]
    
    var isImagePickerPresented: Bool { get set }
    var images: [UIImage] { get set }
}
