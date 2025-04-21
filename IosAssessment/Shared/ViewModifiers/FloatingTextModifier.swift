//
//  FloatingTextModifier.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

struct FloatingTextModifier: ViewModifier {
    var isActive: Bool

    func body(content: Content) -> some View {
        content
            .scaleEffect(isActive ? 0.85 : 1.0, anchor: .leading)
            .offset(y: isActive ? -8 : 0)
            .animation(.easeInOut(duration: 0.2), value: isActive)
    }
}

extension View {
    func floatingLabel(isActive: Bool) -> some View {
        self.modifier(FloatingTextModifier(isActive: isActive))
    }
}
