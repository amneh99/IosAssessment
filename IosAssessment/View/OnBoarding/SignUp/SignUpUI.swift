//
//  SignUpUI.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

struct SignUpUI: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack(spacing: 16) {
            MainTextField(title: "Name", text: $viewModel.userName)
            MainTextField(title: "Email", text: $viewModel.email, type: .email)
            MainTextField(title: "Create a password", text: $viewModel.password, type: .password)
            
            Spacer()
            
            MainFilledButton(title: "Create Account") {
                viewModel.pushList = true
            }
            .navLink(destination: { MedicationsListUI() }, isActive: $viewModel.pushList)

        }
        .padding()
        .addTitle(title: "Create New Account")
    }
}

#Preview {
    SignUpUI()
    
}

private class ViewModel: ObservableObject {
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var pushList = false
}
