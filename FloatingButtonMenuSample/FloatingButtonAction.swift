//
//  FloatingButtonAction.swift
//  FloatingButtonMenuSample
//
//  Created by Juanjo Corbalan on 29/5/24.
//

import SwiftUI

struct FloatingMenuAction: Identifiable {
    let id: UUID = UUID()
    let symbol: String
    var foregroundColor: Color = .primary
    var action: (() -> Void)?
}
