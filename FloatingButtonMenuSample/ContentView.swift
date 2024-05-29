//
//  ContentView.swift
//  FloatingButtonMenuSample
//
//  Created by Juanjo Corbalan on 29/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var backgroundColor: Color = .yellow

    var body: some View {
        NavigationStack {
            SampleListView(backgroundColor: backgroundColor)
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Floating Button Menu")
        }
        .overlay {
            FloatingButtonView(actions:
                                [ FloatingMenuAction(symbol: "moon"),
                                  FloatingMenuAction(symbol: "sun.max")
                                ]
            )
        }
    }
}

#Preview {
    ContentView()
}
