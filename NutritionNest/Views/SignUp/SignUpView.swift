//
//  SignUpView.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 20/09/23.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject private var viewModel = SignUpViewModel()
    
    var body: some View {
        ZStack {
            Color.asset.background
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Text(Localization.SignUp.title)
                    .font(.custom.inter.font(size: 25, relativeTo: .title))
                    .bold()
                    .padding(.top, 32)
                Text(Localization.SignUp.message)
                    .font(.custom.inter.font(size: 15, relativeTo: .subheadline))
                    .foregroundColor(.asset.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
                    .padding(.horizontal, 30)
                TextField("", text: $viewModel.email, prompt: Text(Localization.SignUp.Prompt.email))
                    .primaryTextFieldStyle()
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .padding(.top, 47)
                SecureField("", text: $viewModel.password, prompt: Text(Localization.SignUp.Prompt.password))
                    .primaryTextFieldStyle()
                    .padding(.top, 16)
                Text(viewModel.errorMessage)
                    .font(.custom.inter.font(size: 13, relativeTo: .footnote))
                    .opacity(viewModel.showErrorMessage ? 1 : 0)
                    .foregroundColor(.red)
                    .frame(height: 13)
                    .padding(.top, 10)
                SmallRoundButton(title: Localization.SignUp.Button.signUp) {
                    viewModel.singUp()
                }
                .padding(.top, 10)
                OrText()
                .padding(.top, 32)
                HStack(spacing: 9) {
                    ProviderButton(image: .asset.logos.facebookLogo) {
                        
                    }
                    ProviderButton(image: .asset.logos.googleLogo) {
                        
                    }
                    ProviderButton(image: .asset.logos.appleLogo) {
                        
                    }
                }
                .padding(.top, 22)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 35)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
