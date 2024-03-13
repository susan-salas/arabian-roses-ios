//
//  EventsListViewModel.swift
//  Roses
//
//  Created by Susan Salas on 3/11/24.
//

import SwiftUI
import CoreData
import SwiftData

@MainActor
final class EventsListViewModel: ObservableObject {
        
    @Published var events: [Event] = []
    @Published var shouldShowAlert = false
    var modelContext: ModelContext
    var eventNetworkService: EventsNetworkService
    
    init(modelContext: ModelContext, networkService: EventsNetworkService) {
                self.modelContext = modelContext
        self.eventNetworkService = networkService
        fetchSavedData()
            }
    
    func getEvents() {
        Task {
            do {
                events = try await eventNetworkService.getEvents()
                //everytime new events are recieved they are saved to swiftdata
                saveEvents(events: events)
            } catch {
                shouldShowAlert = true
            }
        }
    }
    
    private func saveEvents(events: [Event]) {
        do {
            //delete previously saved data
            try modelContext.delete(model: Event.self)
            //persist only new events
            for event in events {
                modelContext.insert(event)
            }
        } catch {
            //If data isn't saved ContentUnavialbleView will handle alerting user
            return
        }
    }
    
    private func fetchSavedData() {
        do {
            let descriptor = FetchDescriptor<Event>(sortBy: [SortDescriptor(\.id)])
            events = try modelContext.fetch(descriptor)
        } catch {
            //If data isn't fetched ContentUnavialbleView will handle alerting user
            return
        }
    }
    
}
