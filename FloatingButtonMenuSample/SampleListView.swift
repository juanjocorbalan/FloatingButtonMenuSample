//
//  SampleListView.swift
//  FloatingButtonMenuSample
//
//  Created by Juanjo Corbalan on 29/5/24.
//

import SwiftUI

struct SampleListView: View {
    let backgroundColor: Color

    var body: some View {
        ScrollView(.vertical) {
            LazyVStack {
                ForEach(1...8, id: \.self) { _ in
                    RoundedRectangle(cornerRadius: 12)
                        .fill(backgroundColor.gradient.opacity(0.8))
                        .frame(height: 135)
                }
            }
            .padding()
        }
    }
}

#Preview {
    SampleListView(backgroundColor: .cyan)
}
