//
//  FloatingTextModifier.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

/// A view modifier that creates a floating label effect typically used in text fields.
///
/// `FloatingTextModifier` animates the label by scaling it down and moving it upward when the associated field is active (e.g., when it contains text or is focused).
///
/// - Parameters:
///   - isActive: A Boolean value indicating whether the label should float (true) or remain in place (false).
///
/// - Animations:
///   - Scale: Shrinks to 85% when active
///   - Offset: Moves up by 8 points when active
///   - Duration: 0.2 seconds with ease-in-out transition
///
/// - Usage:
/// Use via the `.floatingLabel(isActive:)` view extension:
/// ```swift
/// Text("Username")
///     .floatingLabel(isActive: !text.isEmpty)
/// ```
///
/// This modifier is ideal for floating placeholder labels in custom text field components.
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
