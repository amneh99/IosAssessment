//
//  MainFilledButton.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

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
