//
//  ContentView.swift
//  week3extra
//
//  Created by 김미주 on 4/2/25.
//

import SwiftUI
import Kingfisher

struct ContentView: View {
    var body: some View {
        VStack {
            if let url = URL(string: "https://i.namu.wiki/i/Dw5ztJQzsUQvugXJj6uoyIPEcvrtVy3esALI9yGzg-Oyn2zlQZNwsdpWPvgAKSVKJAZHsbNQ7sFOmZg0BXh21f88NH28N2SEEMZoOhSCTkYeS2rQBzFrC0ZkcyzbvualXob63wQlHoBVfCHBYeJlfQ.webp") {
                KFImage(url)
                    .downsampling(size: CGSize(width: 400, height: 400)) // 네트워크에서 받은 고해상도 이미지를 메모리 효율적으로 처리할 수 있도록 크기를 줄임 (400*400 크기로 리사이징)
                    .cacheOriginalImage() // 원본 이미지도 캐싱
                    .placeholder({ // 네트워크에서 이미지를 다운로드하는 동안 표시할 placeholder
                        ProgressView()
                            .controlSize(.mini)
                    })
                    .retry(maxCount: 2, interval: .seconds(2)) // 네트워크 요청이 실패했을 때 자동으로 다시 시도 (최대 2번, 2초 간격으로 실행)
                    .onFailure { error in // 이미지 로드 실패 시 특정 이미지를 대체하여 표시할 수 있음
                        print("이미지 로드 실패: \(error)")
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
            }
            Text("경복궁입니다.")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
