//
//  NetoworkManager.swift
//  Roses
//
//  Created by Susan Salas on 3/11/24.
//

import Foundation


struct EventsService: EventsNetworkService {
    private let baseURL = "https://x8ki-letl-twmt.n7.xano.io/api:5v39zU0d/"
    
    func getEvents() async throws -> [Event] {
        guard let url = URL(string: baseURL + "event") else {
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

protocol EventsNetworkService {
    func getEvents() async throws -> [Event]
}

enum APIError: Error, LocalizedError {
    case invalidURL
    case generic(error: Error)
    case invalidResponse
    case invalidData
}
