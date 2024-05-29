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
            FloatingButtonView {
                FloatingMenuAction(symbol: "doc.on.doc") {
                    print("copy action")
                }
                FloatingMenuAction(symbol: "scissors") {
                    print("cut action")
                }
                FloatingMenuAction(symbol: "circle", foregroundColor: .pink) {
                    backgroundColor = .pink
                }
                FloatingMenuAction(symbol: "circle", foregroundColor: .indigo) {
                    backgroundColor = .indigo
                }
                FloatingMenuAction(symbol: "circle", foregroundColor: .mint) {
                    backgroundColor = .mint
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
