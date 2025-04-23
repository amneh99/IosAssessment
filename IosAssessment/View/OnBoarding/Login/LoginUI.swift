//
//  LoginUI.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

struct LoginUI: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            MainTextField(title: "Email", text: $viewModel.email, type: .email)
            MainTextField(title: "Password", text: $viewModel.password, type: .password)
            
            if viewModel.showError {
                Text("Email and password must not be empty")
                    .foregroundColor(.red)
                    .font(.caption)
                    .transition(.opacity)
            }
            
            Spacer()
            
            MainFilledButton(title: "Login") {
                viewModel.validateFields()
            }
            .modifier(ShakeEffect(animatableData: CGFloat(viewModel.shakeTrigger ? 1 : 0)))
            .navLink(destination: { MedicationsListUI() }, isActive: $viewModel.pushList)
        }
        .padding()
        .addTitle(title: "Login")
    }
}

#Preview {
    LoginUI()
}

private class ViewModel: ObservableObject {
    @Published var pushList = false
    @Published var showError = false
    @Published var shakeTrigger = false
    
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    
    func validateFields() {
        if email.isEmpty || password.isEmpty {
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
