//
//  NewsResponse.swift
//  NewsAppSwiftUI
//
//  Created by Muhammed Celal Tok on 6.06.2022.
//

import Foundation

struct NewsResponse: Codable {
    let articles:  [Article]?
}

struct Article: Codable {
    let id = UUID()
    let author, url, source, title, articleDescription, image: String?
    let date: Date?
    
    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}


extension Article {
    static var dummyData: Article {
        .init(author: "Michael Paulson",
              url: "https://www.nytimes.com/2022/06/07/theater/dear-evan-hansen-closing-broadway.html",
              source: "New York Times",
              title: "‘Dear Evan Hansen’ and ‘Tina’ to End Their Broadway Runs - The New York Times",
              articleDescription: "The musicals, both of which lost steam after the pandemic shutdown, will close in late summer.",
              image: "https://static01.nyt.com/images/2022/06/07/multimedia/07hansen-1/07hansen-1-facebookJumbo.jpg",
              date: Date())
    }
}
