//
//  NavLink.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

extension View {
    func navLink<Destination: View>(destination: Destination) -> some View {
        NavigationLink(destination: destination) {
            self
        }
    }
    
    func navLink<Destination: View>(
        destination: @escaping () -> Destination,
        isActive: Binding<Bool>
    ) -> some View {
        self.navigationDestination(isPresented: isActive, destination: destination)
    }
}
