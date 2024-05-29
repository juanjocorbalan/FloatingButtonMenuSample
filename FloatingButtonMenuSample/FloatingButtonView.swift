//
//  FloatingButtonView.swift
//  FloatingButtonMenuSample
//
//  Created by Juanjo Corbalan on 29/5/24.
//

import SwiftUI

struct FloatingButtonView: View {
    @State private var isExpanded = false
    private var buttonSize = CGSize(width: 60, height: 60)
    var actions: [FloatingMenuAction]
    @Environment(\.colorScheme) private var schema

    init(actions: [FloatingMenuAction]) {
        self.actions = actions
    }

    var body: some View {
        GeometryReader { proxy in
            ZStack(alignment: .bottom) {
                Capsule()
                    .fill(.secondary)
                    .frame(width: buttonSize.width,
                           height: isExpanded
                           ? CGFloat(actions.count + 1) * (buttonSize.height + 20)
                           : buttonSize.height)
                    .overlay {
                        if isExpanded {
                            VStack(spacing: 20) {
                                ForEach(actions) { action in
                                    Button(action: {
                                        withAnimation(.snappy) {
                                            action.action?()
                                            isExpanded.toggle()
                                        }
                                    }, label: {
                                        Image(systemName: action.symbol)
                                            .frame(width: buttonSize.width, height: buttonSize.height)
                                            .foregroundStyle(action.foregroundColor)
                                            .font(.title)
                                            .symbolVariant(.fill)

                                    })
                                    .buttonStyle(FloatingButtonStyle())
                                }
                            }
                            .frame(maxHeight: .infinity, alignment: .top)
                            .padding(.top, 20)
                            .transition(.asymmetric(insertion: .push(from: .bottom), removal: .push(from: .top)))
                        }
                    }
                    .clipped()

                Button(action: {
                    withAnimation(.snappy) {
                        isExpanded.toggle()
                    }
                }, label: {
                    Image(systemName: isExpanded ? "plus" : "line.3.horizontal")
                        .frame(width: buttonSize.width, height: buttonSize.height)
                        .foregroundStyle(schema == .dark ? .black : .white)
                        .font(.largeTitle.bold())
                        .background(schema == .dark ? .white : .black)
                        .clipShape(.circle)
                        .shadow(color: .gray, radius: 8, x: 6, y: 6)
                        .rotationEffect(isExpanded ? .degrees(45) : .zero)
                        .scaleEffect(isExpanded ? 1.15 : 1)
                })
                .buttonStyle(FloatingButtonStyle())
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
        }
    }
}

#Preview {
    FloatingButtonView(actions:
                        [ FloatingMenuAction(symbol: "moon"),
                          FloatingMenuAction(symbol: "sun.max")
                        ]
    )
}
