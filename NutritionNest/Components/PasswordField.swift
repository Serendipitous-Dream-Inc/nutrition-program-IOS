//
//  PasswordField.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 16/10/23.
//

import SwiftUI

struct PasswordField: View {
    
    @Binding var text: String
    @State private var showText = false
    
    var imageName: String {
        return showText ? "eye" : "eye.slash"
    }
    
    var body: some View {
        Group {
            if showText {
                TextField("", text: $text, prompt: Text(Localization.SignUp.Prompt.password))
                    .primaryTextFieldStyle()
            } else {
                SecureField("", text: $text, prompt: Text(Localization.SignUp.Prompt.password))
                    .primaryTextFieldStyle()
            }
        }
        .overlay(alignment: .trailing) {
            Button {
                showText.toggle()
            } label: {
                Image(systemName: imageName)
            }
            .tint(Color.asset.passwordToggleColor)
            .padding(.trailing, 10)
        }
    }
}

#Preview {
    PasswordField(text: .constant("123"))
        .padding(.horizontal)
}
