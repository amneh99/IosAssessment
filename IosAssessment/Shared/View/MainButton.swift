//
//  MainButton.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

/// A reusable styled button for use across the app.
///
/// `MainButton` displays a tappable button with customizable text and color, and executes a callback when tapped.
///
/// - Parameters:
///   - title: The text to display on the button.
///   - textColor: The color of the button's text. Defaults to `.mainBlue`.
///   - callback: A closure to be executed when the button is tapped. Defaults to an empty closure.
///
/// - Example:
/// ```swift
/// MainButton(title: "Log In", textColor: .white) {
///     print("Button tapped")
/// }
/// ```
///
/// This view is useful for consistent button styling across the app, with flexibility for title and action.
/// 
struct MainButton: View {
    var title: String
    var textColor: Color = .mainBlue
    var callback: () -> Void = {}

    var body: some View {
        Button {
            callback()
        } label: {
            Text(title)
                .foregroundStyle(textColor)
                .fontWeight(.medium)
                .frame(height: 40)
        }
    }
}

#Preview {
    MainButton(title: "I already have an account")
        .padding()
}
