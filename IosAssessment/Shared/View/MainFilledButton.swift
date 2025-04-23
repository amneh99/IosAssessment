//
//  MainFilledButton.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

/// A customizable filled button with rounded corners for use throughout the app.
///
/// `MainFilledButton` provides a solid background button with configurable title, background color, text color,
/// and a callback action when tapped.
///
/// - Parameters:
///   - title: The text displayed on the button.
///   - bgColor: The background color of the button. Defaults to `.mainBlue`.
///   - textColor: The color of the button's text. Defaults to `.white`.
///   - callback: A closure executed when the button is tapped. Defaults to an empty closure.
///
/// - Design:
///   - Height: 50 points
///   - Corner Radius: 12 points
///
/// - Example:
/// ```swift
/// MainFilledButton(title: "Sign Up", bgColor: .green, textColor: .black) {
///     print("Sign Up tapped")
/// }
/// ```
///
struct MainFilledButton: View {
    var title: String
    var bgColor: Color = .mainBlue
    var textColor: Color = .white
    var callback: () -> Void = {}

    var body: some View {
        Button {
            callback()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(bgColor)
                    .frame(height: 50)
                
                Text(title)
                    .foregroundStyle(textColor)
                    .fontWeight(.medium)
            }
        }
    }
}

#Preview {
    MainFilledButton(title: "Create New Account")
        .padding()
}
