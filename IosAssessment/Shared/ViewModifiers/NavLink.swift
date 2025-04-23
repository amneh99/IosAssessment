//
//  NavLink.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

extension View {
    /// Wraps the current view in a `NavigationLink` with a static destination.
    ///
    /// Use this method to make any view tappable and navigate to a fixed destination when tapped.
    ///
    /// - Parameter destination: The view to navigate to.
    /// - Returns: A view wrapped in a `NavigationLink` that navigates to the specified destination on tap.
    ///
    /// - Usage:
    /// ```swift
    /// Text("Go to Details")
    ///     .navLink(destination: DetailsView())
    /// ```
    func navLink<Destination: View>(destination: Destination) -> some View {
        NavigationLink(destination: destination) {
            self
        }
    }
    
    /// Presents a view conditionally using `navigationDestination` based on an `isActive` binding.
        ///
        /// Use this method when you want to control navigation programmatically (e.g., after a login or button action).
        ///
        /// - Parameters:
        ///   - destination: A closure returning the destination view.
        ///   - isActive: A binding to a Boolean value that determines whether the destination should be shown.
        /// - Returns: A view that triggers a navigation when `isActive` becomes `true`.
        ///
        /// - Usage:
        /// ```swift
        /// Button("Login") {
        ///     isLoggedIn = true
        /// }
        /// .navLink(destination: { HomeView() }, isActive: $isLoggedIn)
        /// ```
    func navLink<Destination: View>(
        destination: @escaping () -> Destination,
        isActive: Binding<Bool>
    ) -> some View {
        self.navigationDestination(isPresented: isActive, destination: destination)
    }
}
