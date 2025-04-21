//
//  OnBoardingUI.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

struct OnBoardingUI: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blueBackground
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    
                    Image(.logo)
                        .logoAnimation(isVisible: viewModel.showLogo)
                    
                    Spacer()
                    
                    if viewModel.showButtons {
                        VStack(spacing: 16) {
                            MainFilledButton(title: "Create New Account") {
                                viewModel.pushSignUp = true
                            }
                            .navLink(destination: { SignUpUI() }, isActive: $viewModel.pushSignUp)
                            
                            MainButton(title: "I already have an account") {
                                viewModel.pushLogin = true
                            }
                            .navLink(destination: { LoginUI() }, isActive: $viewModel.pushLogin)
                        }
                        .transition(.move(edge: .bottom).combined(with: .opacity))
                        .padding(.bottom, 32)
                    }
                }
                .padding(16)
            }
            .onAppear {
                withAnimation {
                    viewModel.showLogo = true
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation {
                        viewModel.showButtons = true
                    }
                }
            }
        }
    }
}

#Preview {
    OnBoardingUI()
}

private class ViewModel: ObservableObject {
    @Published var showLogo = false
    @Published var showButtons = false
    @Published var pushLogin = false
    @Published var pushSignUp = false
}

