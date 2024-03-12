//
//  EventViewModel.swift
//  Roses
// 
//  Created by Susan Salas on 3/10/24.
//

import Foundation
import SwiftData

struct Event: Decodable, Identifiable {
    let title: String
    let image: String
    let content: String
    let id: Int
}

struct MockData {
    static let samplePost = Event(title: "Technique Class", image: "PHOTO-2024-01-22-20-40-29", content: "Despriction: Open technique classes with Yesenia! We'll be working on Hagala drills and variations, pop-and-lock polishing, muscle-building exercises and advanced viel tricks.", id: 1)
    
    static let posts = [samplePost, samplePost, samplePost, samplePost]
}
