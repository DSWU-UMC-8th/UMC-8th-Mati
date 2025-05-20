//
//  BookModel.swift
//  week6practice
//
//  Created by 김미주 on 5/13/25.
//

import Foundation

struct BookModel: Codable {
    let documents: [Documents]
    let meta: Meta
    
    // MARK: - Meta
    struct Meta: Codable {
        let isEnd: Bool?
        let pageableCount: Int?
        let totalCount: Int?
        
        enum CodingKeys: String, CodingKey {
            case isEnd = "is_end"
            case pageableCount = "pageable_count"
            case totalCount = "total_count"
        }
    }
    
    // MARK: - Documents
    struct Documents: Codable {
        let authors: [String]
        let contents: String
        let datetime: String
        let isbn: String
        let price: Int
        let publisher: String
        let salePrice: Int?
        let status: String
        let thumbnail: String
        let title: String
        let translators: [String]
        let url: String
        
        enum CodingKeys: String, CodingKey {
            case authors, contents, datetime, isbn, price, publisher
            case salePrice = "sale_price"
            case status, thumbnail, title, translators, url
        }
    }
}
