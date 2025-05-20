//
//  KakaoInterceptor.swift
//  week6practice
//
//  Created by 김미주 on 5/13/25.
//

import Foundation
import Alamofire

class KakaoInterceptor: RequestInterceptor, @unchecked Sendable {
    private let kakaoAPIKey: String
    
    init(apiKey: String) {
        self.kakaoAPIKey = apiKey
    }
    
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, any Error>) -> Void) {
        var request = urlRequest
        request.headers.add(.authorization("KakaoAK \(kakaoAPIKey)"))
        
        completion(.success(request))
    }
}
