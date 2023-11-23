//
//  SignUpView.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 20/09/23.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject private var viewModel = SignUpViewModel()
    @Environment(\.dismiss) var dismiss
    
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
                TextField("", text: $viewModel.email, prompt: Text(Localization.Shared.Prompt.email))
                    .primaryTextFieldStyle()
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .padding(.top, 47)
                PasswordField(text: $viewModel.password, prompt: Localization.Shared.Prompt.password)
                    .padding(.top, 16)
                PasswordField(text: $viewModel.password, prompt: Localization.Shared.Prompt.confirmPassword)
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
                    ProviderButton(image: .assets.logos.facebookLogo) {
                        viewModel.signUpFacebook()
                    }
                    ProviderButton(image: .assets.logos.googleLogo) {
                        viewModel.signUpGoogle()
                    }
                    ProviderAppleButton { request in
                        viewModel.configureAppleSignUpRequest(request: request)
                    } onCompletion: { result in
                        viewModel.signUpApple(result: result)
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
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .bold()
                        .foregroundColor(.black)
                }
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            Text("Test")
                .navigationDestination(isPresented: .constant(true)) {
                    SignUpView()
                }
        }
    }
}
