//
//  LogoAnimationModifier.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

/// A view modifier that animates the appearance of a logo or similar visual element.
///
/// `LogoAnimationModifier` provides a smooth entrance animation by adjusting the scale, opacity, and vertical offset of a view based on its visibility state.
///
/// - Parameters:
///   - isVisible: A Boolean value that determines whether the logo should be shown (`true`) or hidden (`false`).
///
/// - Animation Details:
///   - Scale: From 0.5 to 1
///   - Opacity: From 0 to 1
///   - Offset Y: From 0 to -150
///   - Duration: 0.8 seconds with `.easeOut` transition
///
/// - Usage:
/// Use via the `.logoAnimation(isVisible:)` view extension:
/// ```swift
/// Image("logo")
///     .logoAnimation(isVisible: showLogo)
/// ```
///
/// This modifier is ideal for splash screens or onboarding views where a smooth logo reveal enhances the user experience.
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
