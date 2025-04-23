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
        VStack(alignment: .leading, spacing: 16) {
            MainTextField(title: "Name", text: $viewModel.userName)
            MainTextField(title: "Email", text: $viewModel.email, type: .email)
            MainTextField(title: "Create a password", text: $viewModel.password, type: .password)
            
            if viewModel.showError {
                Text("Email and password must not be empty")
                    .foregroundColor(.red)
                    .font(.caption)
                    .transition(.opacity)
            }
            
            Spacer()
            
            MainFilledButton(title: "Create Account") {
                viewModel.validateFields()
            }
            .modifier(ShakeEffect(animatableData: CGFloat(viewModel.shakeTrigger ? 1 : 0)))
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
    @Published var showError = false
    @Published var shakeTrigger = false
    
    func validateFields() {
        if email.isEmpty || password.isEmpty || userName.isEmpty {
            withAnimation {
                showError = true
                shakeTrigger.toggle()
            }
        } else {
            showError = false
            pushList = true
        }
    }
}
