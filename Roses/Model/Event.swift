//
//  EventViewModel.swift
//  Roses
// 
//  Created by Susan Salas on 3/10/24.
//

import Foundation
import SwiftData

@Model
class Event: Decodable, Identifiable {
    let title: String
    let image: String
    let content: String
    let id: Int
    
    enum CodingKeys: String, CodingKey {
        case title
        case image
        case content
        case id
    }
    
    //need custom init due to @Model macro - not needed for nonpersisted models
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.image = try container.decode(String.self, forKey: .image)
        self.content = try container.decode(String.self, forKey: .content)
        self.id = try container.decode(Int.self, forKey: .id)
    }
    
    
}
