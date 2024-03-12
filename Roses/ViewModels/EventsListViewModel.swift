//
//  EventsListViewModel.swift
//  Roses
//
//  Created by Susan Salas on 3/11/24.
//

import SwiftUI
import CoreData

@MainActor
final class EventsListViewModel: ObservableObject {
        
    @Published var events: [Event] = []
    
    func getEvents() {
        Task {
            do {
                events = try await NetoworkManager.shared.getEvents()
            } catch let error {
                print(error)
            }
        }
    }
}
