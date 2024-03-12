//
//  NetoworkManager.swift
//  Roses
//
//  Created by Susan Salas on 3/11/24.
//

import Foundation


final class NetoworkManager {
    static let shared = NetoworkManager()
    private let baseURL = "https://jsonplaceholder.org/posts"
    
    func getEvents() async throws -> [Event] {
        guard let url = URL(string: baseURL) else {
            throw APIError.invalidURL
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw APIError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let decoderResponse = try decoder.decode([Event].self, from: data)
            return decoderResponse
        } catch {
            throw APIError.invalidData
        }
    }
}


enum APIError: Error {
    case invalidURL
    case generic(error: Error)
    case invalidResponse
    case invalidData
}
