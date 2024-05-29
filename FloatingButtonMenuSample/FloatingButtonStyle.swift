//
//  FloatingButtonStyle.swift
//  FloatingButtonMenuSample
//
//  Created by Juanjo Corbalan on 29/5/24.
//

import SwiftUI

struct FloatingButtonStyle: ButtonStyle {
    @Environment(\.colorScheme) private var schema

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.largeTitle.bold())
            .foregroundStyle(schema == .dark ? .black : .white)
            .background(schema == .dark ? .white : .black)
            .clipShape(.circle)
            .shadow(color: .gray, radius: 8, x: 6, y: 6)
    }
}
