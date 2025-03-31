//
//  MovieView.swift
//  week2practice2
//
//  Created by 김미주 on 3/29/25.
//

import SwiftUI
import Observation

struct MovieView: View {
    
    @AppStorage("movieName") private var movieName: String = ""
    private var viewModel: MovieViewModel = .init()
    
    var body: some View {
        VStack(spacing: 56) {
            MovieCard(movieInfo: viewModel.movieModel[viewModel.currentIndex])
            
            changeMovie
            
            SettingButton
            
            SavedMovie
        }
    }
    
    private var changeMovie: some View {
        HStack {
            Button(action: {
                viewModel.previousMovie()
            }) {
                Image(.iconLeft)
            }
            
            Spacer()
            
            Text("영화 바꾸기")
                .font(.system(size: 20))
            
            Spacer()
            
            Button(action: {
                viewModel.nextMovie()
            }) {
                Image(.iconRight)
            }
        }
        .frame(width: 256)
        .padding(.vertical, 17)
        .padding(.horizontal, 22)
    }
    
    private var SettingButton: some View {
        Button(action: {
            self.movieName = viewModel.movieModel[viewModel.currentIndex].movieName
        }) {
            Text("대표 영화로 설정")
                .font(.system(size: 20))
                .foregroundStyle(.black)
        }
        .frame(width: 246, height: 65)
        .overlay(content: {
            RoundedRectangle(cornerRadius: 20)
                .fill(.clear)
                .stroke(.black, style: .init(lineWidth: 1))
        })
    }
    
    private var SavedMovie: some View {
        VStack(spacing: 17) {
            Text("@AppStorage에 저장된 영화")
                .font(.system(size: 30))
            
            Text("현재 저장된 영화: \(movieName)")
                .font(.system(size: 20))
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    MovieView()
}
