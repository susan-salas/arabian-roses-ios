//
//  EventsListView.swift
//  Roses
//
//  Created by Susan Salas on 3/10/24.
//

import SwiftUI

struct EventsListView: View {
    @ObservedObject var viewModel = EventsListViewModel()
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(viewModel.events) { event in
                    EventView(event: event)
                }
            }
            .frame( maxWidth: .infinity)
            .listStyle(PlainListStyle())
            .navigationTitle("Welcome, Rose!")
        }
        .onAppear {
            viewModel.getEvents()
        }
    }
}

#Preview {
    EventsListView()
}


