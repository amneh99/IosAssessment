//
//  MainTextField.swift
//  IosAssessment
//
//  Created by Amneh Shalabyeh on 4/21/25.
//

import SwiftUI

struct MainTextField: View {
    var title: String
    @Binding var text: String
    var type: TextFieldType = .text
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 6)
                .fill(.textFieldBg)
                .frame(height: 60)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.darkGrayTf)
                    .floatingLabel(isActive: !text.isEmpty)
    
                textField()
                    .foregroundStyle(.gray)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
        }
    }
    
    func textField() -> some View {
        Group {
            switch type {
            case .text:
                normalTextField()
            case .email:
                emailTextField()
            case .password:
                passwordTextField()
            }
        }
    }
    
    func normalTextField() -> some View {
        TextField("", text: $text)
            .font(.system(size: 14, weight: .medium))
            .multilineTextAlignment(.leading)
    }
    
    func emailTextField() -> some View {
        TextField("", text: $text)
            .font(.system(size: 14, weight: .medium))
            .keyboardType(.emailAddress)
            .multilineTextAlignment(.leading)
    }
    
    func passwordTextField() -> some View {
        SecureField("", text: $text)
            .font(.system(size: 14, weight: .medium))
            .multilineTextAlignment(.leading)
    }
}
#Preview {
    MainTextFieldViewer()
}

enum TextFieldType {
    case text
    case email
    case password
    //case phoneNumber
    //case picker([String])
    //case date
}

struct MainTextFieldViewer: View {
    @State var text = ""
    
    var body: some View {
        MainTextField(title: "Name", text: $text)
            .padding()
    }
}

