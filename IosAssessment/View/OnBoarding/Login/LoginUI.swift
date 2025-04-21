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
        VStack(spacing: 16) {
            MainTextField(title: "Email", text: $viewModel.email, type: .email)
            MainTextField(title: "Password", text: $viewModel.password, type: .password)
            
            Spacer()
            
            MainFilledButton(title: "Login") {
                viewModel.pushList = true
            }
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
    @Published var userName = ""
    @Published var email = ""
    @Published var password = ""
    
    @Published var pushList = false
}
