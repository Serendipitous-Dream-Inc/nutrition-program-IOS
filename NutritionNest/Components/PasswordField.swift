//
//  PasswordField.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 16/10/23.
//

import SwiftUI

struct PasswordField: View {
    
    @Binding var text: String
    let prompt: String
    @State private var showText = false
    
    var imageName: String {
        return showText ? "eye" : "eye.slash"
    }
    
    var body: some View {
        Group {
            if showText {
                TextField("", text: $text, prompt: Text(prompt))
                    .primaryTextFieldStyle()
            } else {
                SecureField("", text: $text, prompt: Text(prompt))
                    .primaryTextFieldStyle()
            }
        }
        .overlay(alignment: .trailing) {
            Button {
                showText.toggle()
            } label: {
                Image(systemName: imageName)
            }
            .tint(AssetColors.passwordToggleColor)
            .padding(.trailing, 10)
        }
    }
}

#Preview {
    PasswordField(text: .constant("123"), prompt: Localization.Shared.Prompt.password)
        .padding(.horizontal)
}
