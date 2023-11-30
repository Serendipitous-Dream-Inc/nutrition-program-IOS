//
//  SignInView.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 20/09/23.
//

import SwiftUI
import AuthenticationServices

struct SignInView: View {
    
    @StateObject private var viewModel = SignInViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ZStack {
            AssetColors.background
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Text(Localization.LogIn.title)
                    .font(CustomFonts.inter.font(size: 25, relativeTo: .title))
                    .bold()
                    .padding(.top, 32)
                Text(Localization.LogIn.message)
                    .font(CustomFonts.inter.font(size: 15, relativeTo: .subheadline))
                    .foregroundColor(AssetColors.gray)
                    .multilineTextAlignment(.center)
                    .padding(.top, 10)
                    .padding(.horizontal, 30)
                TextField("", text: $viewModel.email, prompt: Text(Localization.Shared.Prompt.email))
                    .primaryTextFieldStyle()
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .padding(.top, 47)
                PasswordField(text: $viewModel.password, prompt: Localization.Shared.Prompt.password)
                    .padding(.top, 16)
                Text(viewModel.errorMessage)
                    .font(CustomFonts.inter.font(size: 13, relativeTo: .footnote))
                    .opacity(viewModel.showErrorMessage ? 1 : 0)
                    .foregroundColor(.red)
                    .frame(height: 13)
                    .padding(.top, 10)
                SmallRoundButton(title: Localization.LogIn.Button.logIn) {
                    viewModel.signIn()
                }
                .padding(.top, 10)
                OrText()
                .padding(.top, 32)
                HStack(spacing: 9) {
                    ProviderButton(image: AssetImages.Logos.facebookLogo) {
                        viewModel.signInFacebook()
                    }
                    ProviderButton(image: AssetImages.Logos.googleLogo) {
                        viewModel.signInGoogle()
                    }
                    ProviderAppleButton { request in
                        viewModel.configureAppleSignInRequest(request: request)
                    } onCompletion: { result in
                        viewModel.signInApple(result: result)
                    }
                }
                .padding(.top, 22)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .padding(.horizontal, 35)
        }
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                BackButton {
                    dismiss()
                }
            }
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
