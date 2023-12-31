//
//  CustomModifiers.swift
//  Appetizers
//
//  Created by Bhumika Hirapara on 12/16/23.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content // content - Button(we are modifying button here)
            /// if we select .borderedProminent - we get exact same color
            /// but .bordered gives you kind of opacity
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)    /// little big size (.padding)
    }
}

extension View {
    func standardButtonStyle() -> some View {
        self.modifier(StandardButtonStyle())
    }
}
