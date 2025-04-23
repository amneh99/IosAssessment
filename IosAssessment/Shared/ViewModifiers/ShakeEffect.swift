//
//  ShakeEffect.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/23/25.
//

import SwiftUI

/// A custom `GeometryEffect` that creates a horizontal shaking animation.
///
/// Useful for indicating invalid input or drawing attention to a view (e.g., a text field or button).
///
/// - Parameters:
///   - amount: The maximum distance the view moves horizontally (default is 10).
///   - shakesPerUnit: How many shakes occur during the animation duration (default is 3).
///   - animatableData: A value that drives the animation. Typically animated from 0 to 1.
///
struct ShakeEffect: GeometryEffect {
    var amount: CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat

    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(
            CGAffineTransform(translationX:
                amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)),
                y: 0
            )
        )
    }
}
