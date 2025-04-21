//
//  MainTitleModifier.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

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
