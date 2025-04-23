//
//  MainTitleModifier.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

/// A view modifier that adds a main title above a view with consistent styling and spacing.
///
/// `MainTitleModifier` places a bold, blue title above the view it modifies, using a vertical stack with spacing.
///
/// - Parameters:
///   - title: The title text to be displayed above the content.
///
/// - Styling:
///   - Font: 24pt, bold
///   - Color: `.mainBlue`
///   - Vertical Spacing: 22 points between the title and the content
///
/// - Usage:
/// Use via the `.addTitle(title:)` view extension:
/// ```swift
/// VStack {
///     Text("Some content")
/// }
/// .addTitle(title: "Welcome")
/// ```
///
struct MainTitleModifier: ViewModifier {
    var title: String
    
    func body(content: Content) -> some View {
        VStack(spacing: 22) {
            Text(title)
                .foregroundStyle(.mainBlue)
                .font(.system(size: 24, weight: .bold))
            content
        }
    }
}

extension View {
    func addTitle(title: String) -> some View {
        self.modifier(MainTitleModifier(title: title))
    }
}
