//
//  ServiceManager.swift
//  week6concept
//
//  Created by 김미주 on 5/20/25.
//

import Foundation
import Alamofire

class ServiceManager {
    private let urlString: String = "\(Config.baseURL)/person"
    
    // MARK: - GET
    func getUser(name: String) async {
        let parameters: [String: String] = [
            "name": name
        ]
        
        do {
            let user = try await AF.request(urlString, method: .get, parameters: parameters, encoding: URLEncoding.default)
                .serializingDecodable(UserDTO.self)
                .value
            print("GET 성공: ", user)
        } catch {
            print("GET 실패: ", error.localizedDescription)
        }
    }
    
    // MARK: - POST
    func postUser(user: UserDTO) async {
        do {
            let response = try await AF.request(urlString, method: .post, parameters: user, encoder: JSONParameterEncoder.default)
                .serializingString()
                .value
            print("POST 성공: ", response)
        } catch {
            print("POST 실패: ", error.localizedDescription)
        }
    }
    
    // MARK: - PUT
    func putUser(user: UserDTO) async {
        do {
            let response = try await AF.request(urlString, method: .put, parameters: user, encoder: JSONParameterEncoder.default)
                .serializingString()
                .value
            print("PUT 성공: ", response)
        } catch {
            print("PUT 실패: ", error.localizedDescription)
        }
    }
    
    // MARK: - PATCH
    func patchUser(name: String) async {
        let parameters: [String: String] = [
            "name": name
        ]
        
        do {
            let response = try await AF.request(urlString, method: .patch, parameters: parameters, encoding: JSONEncoding.default)
                .serializingString()
                .value
            print("PATCH 성공: ", response)
        } catch {
            print("PATCH 실패: ", error.localizedDescription)
        }
    }
    
    // MARK: - DELETE
    func deleteUser(name: String) async {
        let parameters: [String: String] = [
            "name": name
        ]
        
        do {
            let response = try await AF.request(urlString, method: .delete, parameters: parameters, encoding: URLEncoding.default)
                .serializingString()
                .value
            print("DELETE 성공:", response)
        } catch {
            print("DELETE 실패:", error.localizedDescription)
        }
    }
}
