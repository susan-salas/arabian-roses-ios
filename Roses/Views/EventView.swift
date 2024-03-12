//
//  EventView.swift
//  Roses
//
//  Created by Susan Salas on 3/12/24.
//

import SwiftUI

struct EventView: View {
    let event: Event
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: event.image)) { image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                Image(systemName: "photo.artframe")
            }
            CaptionView(title: event.title, description: event.content)
        }
    }
}

