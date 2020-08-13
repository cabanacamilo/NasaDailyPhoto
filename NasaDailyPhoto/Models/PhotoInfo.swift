//
//  PhotoInfo.swift
//  NasaDailyPhoto
//
//  Created by Camilo Cabana on 13/08/20.
//  Copyright © 2020 Camilo Cabana. All rights reserved.
//

import Foundation

struct PhotoInfo: Codable {
    var title: String
    var description: String
    var url: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description = "explanation"
        case url
    }
    
    init(from decoder: Decoder) throws {
        let valueContainer = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try valueContainer.decode(String.self, forKey: CodingKeys.title)
        self.description = try valueContainer.decode(String.self, forKey: CodingKeys.description)
        self.url = try valueContainer.decode(String.self, forKey: CodingKeys.url)
    }
}
