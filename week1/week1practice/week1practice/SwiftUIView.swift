//
//  SwiftUIView.swift
//  week1practice
//
//  Created by 김미주 on 3/19/25.
//

import SwiftUI

struct SwiftUIView: View {
    var body: some View {
        VStack {
            // MARK: - Text
            Text("Hello, World!\nHello, World!")
                .font(.largeTitle) // 폰트
                .foregroundStyle(.red) // 텍스트 색상
                .underline() // 밑줄 - nil: 기본색 적용
                .strikethrough(true, color: .black) // 취소선
                .lineLimit(nil) // 최대 라인 수 - nil: 필요한 만큼
                .kerning(1.5) // 글자 사이 간격
                .lineSpacing(5) // 줄 사이 간격
                .padding(10) // 패딩
                .overlay(content: { // 해당 뷰 앞에 지정한 뷰 추가, 나열한 순서대로 쌓임
                    RoundedRectangle(cornerRadius: 10) // 모서리 둥글게
                        .fill(.clear) // 색상 채우기
                        .stroke(.black, style: .init(lineWidth: 1)) // 테두리
                })
                .dynamicTypeSize(.large) // 동적 크기 조정
            
            // MARK: - Image
            Image(systemName: "eraser.fill")
                .resizable()
                .frame(width: 100, height: 100)
                .aspectRatio(contentMode: .fit)
                .background() {
                    Circle()
                        .fill(.green)
                        .frame(width: 80, height: 80)
                        .border(.black)
                }
                .border(.red)
                .clipShape(RoundedRectangle(cornerRadius: 30))
                .foregroundStyle(.red)
            
            // MARK: - Button
            Button(action: {
                print("Button Clicked!")
            }) {
                Text("Click Here")
                    .padding()
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            // MARK: - Label
            Button(action: {
                print("Label Clicked!")
            }, label: {
                Label(title: {
                    Text("Text in Label")
                }, icon: {
                    Image(systemName: "rectangle.portrait.and.arrow.right.fill")
                        .imageScale(.large)
                })
                .labelStyle(.titleAndIcon)
                .foregroundStyle(.green)
            })
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var devices = ["iPhone 11", "iPhone 16 Pro"]
    
    static var previews: some View {
        ForEach(devices, id: \.self) { device in
            SwiftUIView()
                .previewDevice(PreviewDevice(rawValue: device))
                .previewDisplayName(device)
        }
    }
}
