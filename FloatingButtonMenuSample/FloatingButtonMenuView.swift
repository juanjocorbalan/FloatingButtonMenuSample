//
//  FloatingButtonMenuView.swift
//  FloatingButtonMenuSample
//
//  Created by Juanjo Corbalan on 29/5/24.
//

import SwiftUI

struct FloatingButtonMenuView: View {
    @Binding private var isExpanded: Bool
    var size: CGFloat
    var actions: [FloatingMenuAction]

    init(isExpanded: Binding<Bool>, size: CGFloat, actions: [FloatingMenuAction]) {
        self._isExpanded = isExpanded
        self.size = size
        self.actions = actions
    }

    var body: some View {
        Capsule()
            .fill(.secondary)
            .frame(width: size, height: isExpanded
                   ? CGFloat(actions.count + 1) * (size + 10) + 20
                   : size)
            .overlay {
                if isExpanded {
                    VStack(spacing: 10) {
                        ForEach(actions) { action in
                            Button(action: {
                                withAnimation(.snappy(duration: 0.3)) {
                                    isExpanded.toggle()
                                }
                                withAnimation(.snappy(duration: 0.3).delay(0.3)) {
                                    action.action?()
                                }
                            }, label: {
                                Image(systemName: action.symbol)
                                    .symbolVariant(.fill)
                                    .foregroundStyle(action.foregroundColor)
                                    .font(.title)
                                    .frame(width: size, height: size)
                            })
                        }
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    .padding(.top, 20)
                    .transition(.asymmetric(insertion: .push(from: .bottom), removal: .push(from: .top)))
                }
            }
            .clipped()
    }
}

#Preview {
    FloatingButtonMenuView(isExpanded: .constant(true), size: 65, actions: [])
}
