//
//  FloatingButtonView.swift
//  FloatingButtonMenuSample
//
//  Created by Juanjo Corbalan on 29/5/24.
//

import SwiftUI

struct FloatingButtonView: View {
    @State private var isExpanded = false
    var size: CGFloat
    var actions: [FloatingMenuAction]

    init(size: CGFloat = 65,
         @FloatingMenuActionResultBuilder actions: () -> [FloatingMenuAction]) {
        self.size = size
        self.actions = actions()
    }

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                FloatingButtonMenuView(isExpanded: $isExpanded, size: size, actions: actions)

                Button(action: {
                    withAnimation(.snappy) {
                        isExpanded.toggle()
                    }
                }, label: {
                    Image(systemName: isExpanded ? "plus" : "line.3.horizontal")
                        .frame(width: size, height: size)
                        .rotationEffect(isExpanded ? .degrees(45) : .zero)
                })
                .buttonStyle(FloatingButtonStyle())
                .scaleEffect(isExpanded ? 1.2 : 1)
            }
            .padding(.trailing, 24)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
    }
}

#Preview {
    FloatingButtonView {
        FloatingMenuAction(symbol: "sun.max") { print("sun") }
        FloatingMenuAction(symbol: "moon") { print("moon") }
    }
}
