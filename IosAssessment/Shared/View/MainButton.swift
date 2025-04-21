//
//  MainButton.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

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
