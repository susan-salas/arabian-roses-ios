//
//  EventsListView.swift
//  Roses
//
//  Created by Susan Salas on 3/10/24.
//

import SwiftUI
import SwiftData

struct EventsListView: View {
    @ObservedObject var viewModel: EventsListViewModel
    
    init(modelContext: ModelContext, networkService: EventsNetworkService) {
        let viewModel = EventsListViewModel(modelContext: modelContext, networkService: networkService)
        _viewModel = ObservedObject(initialValue: viewModel)
    }
    
    var body: some View {
        
        NavigationView {
            
            if viewModel.events.isEmpty {
                ContentUnavailableView("No events at this time.", systemImage: "mappin.slash.circle.fill", description: Text("Check back later to see events in your area."))
            } else {
                List {
                    ForEach(viewModel.events) { event in
                        EventView(event: event)
                    }
                }
                .frame( maxWidth: .infinity)
                .listStyle(PlainListStyle())
                .navigationTitle("Welcome, Rose!")
            }
        }
        .alert("Unable to get events at this time", isPresented: $viewModel.shouldShowAlert, actions: {})
        .onAppear {
            viewModel.getEvents()
        }
    }
}
