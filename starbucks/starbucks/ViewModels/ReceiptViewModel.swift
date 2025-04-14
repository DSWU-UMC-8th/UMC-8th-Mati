//
//  ReceiptViewModel.swift
//  starbucks
//
//  Created by 김미주 on 4/14/25.
//

import SwiftUI
import Vision

@Observable
class ReceiptViewModel {
    var receipts: [ReceiptModel] = []
    var lastImage: UIImage = UIImage()
    
    func startOCR(image: UIImage) {
        self.lastImage = image
        guard let cgImage = image.cgImage else { return }
        
        let request = VNRecognizeTextRequest { [weak self] request, error in
            guard let self = self,
                  let observations = request.results as? [VNRecognizedTextObservation],
                  error == nil else {
                return
            }
            
            let recognizedText = observations.compactMap { $0.topCandidates(1).first?.string }
            let fullText = recognizedText.joined(separator: "\n")
            let parsed = self.parseWithoutRegex(from: fullText)
            
            DispatchQueue.main.async {
                self.receipts.append(parsed)
            }
        }
        
        request.recognitionLevel = .accurate
        request.recognitionLanguages = ["ko-KR"]
        
        DispatchQueue.global(qos: .userInitiated).async {
            let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
            try? handler.perform([request])
        }
    }
    
    func parseWithoutRegex(from text: String) -> ReceiptModel {
        let lines = text.components(separatedBy: .newlines)
        
        var store = "장소 없음"
        var total = 0
        var date = "날짜 없음"
        
        var i = 0
        
        print("===== OCR 디버그 시작 =====")
        
        while i < lines.count {
            let trimmed = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)
            print("🔸 [\(i)] \(trimmed)")
            
            // 매장
            if store == "장소 없음", trimmed.contains("점") {
                store = trimmed
            }
            
            // 날짜
            if date == "날짜 없음", trimmed.contains("-"), trimmed.contains(":"), !trimmed.contains("T") {
                date = trimmed
            }
            
            // 가격
            if trimmed.contains("결제금액"), i+2 < lines.count {
                let priceLine = lines[i+2].trimmingCharacters(in: .whitespaces)
                let numberOnly = priceLine.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                if let amount = Int(numberOnly) {
                    total = amount
                }
            }

            i += 1
        }
        
        return ReceiptModel(store: store, date: date, total: total, image: lastImage)
        
    }
}
