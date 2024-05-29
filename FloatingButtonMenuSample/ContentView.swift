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
                .toolbarTitleDisplayMode(.inline)
                .navigationTitle("Floating Button Menu")
        }
    }
}

#Preview {
    ContentView()
}
