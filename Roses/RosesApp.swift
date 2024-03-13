//
//  RosesApp.swift
//  Roses
//
//  Created by Susan Salas on 3/9/24.
//

import SwiftUI
import SwiftData

@main
struct RosesApp: App {
    
    let container: ModelContainer
    
    var body: some Scene {
        WindowGroup {
            EventsListView(modelContext: container.mainContext, networkService: EventsService())
        }
    }
    init() {
            do {
                container = try ModelContainer(for: Event.self)
            } catch {
                fatalError("Failed to create ModelContainer for Events.")
            }
        }
}
