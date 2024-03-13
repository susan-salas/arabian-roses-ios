//
//  CaptionView.swift
//  Roses
//
//  Created by Susan Salas on 3/12/24.
//

import SwiftUI

struct CaptionView: View {
    let title: String
    let description: String
    let location: String
    let date: Date
    var body: some View {
        VStack(alignment: .leading) {
            Text(title).font(.title2)
                .fontWeight(.medium)
            Text(location)
            Text(description).padding(1)
        }
    }
}



