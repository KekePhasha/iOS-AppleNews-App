//
//  NewsData.swift
//  AppleNews
//
//  Created by Kekeletso Phasha on 2023/06/22.
//

import Foundation

struct Results: Codable {
    let articles: [Posts]
}

 struct Posts: Codable, Identifiable {
     var id: UUID? = UUID()
    let source: SourceName
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String?
    let content: String
}

struct SourceName: Codable {
    let name: String
}
