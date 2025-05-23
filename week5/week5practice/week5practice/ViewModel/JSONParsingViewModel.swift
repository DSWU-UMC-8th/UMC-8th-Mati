//
//  JSONParsingViewModel.swift
//  week5practice
//
//  Created by 김미주 on 5/6/25.
//

import Foundation

@Observable
class JSONParsingViewModel {
    var myProfile: MyModel?
    
    func loadMyProfile(completion: @escaping (Result<MyModel, Error>) -> Void) {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            print("json 파일 없음")
            completion(.failure(NSError(domain: "파일 못찾아요!", code: 404, userInfo: nil)))
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoded = try JSONDecoder().decode(MyModel.self, from: data)
            self.myProfile = decoded
            completion(.success(decoded))
        } catch {
            print("디코딩 실패: \(error.localizedDescription)")
            completion(.failure(error))
        }
    }
}
