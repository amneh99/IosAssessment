//
//  LogoAnimationModifier.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

struct LogoAnimationModifier: ViewModifier {
    var isVisible: Bool

    func body(content: Content) -> some View {
        content
            .scaleEffect(isVisible ? 1 : 0.5)
            .opacity(isVisible ? 1 : 0)
            .offset(y: isVisible ? -150 : 0)
            .animation(.easeOut(duration: 0.8), value: isVisible)
    }
}

extension View {
    func logoAnimation(isVisible: Bool) -> some View {
        self.modifier(LogoAnimationModifier(isVisible: isVisible))
    }
}
