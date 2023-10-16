//
//  SignUpViewModel.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 04/10/23.
//

import SwiftUI
import AuthenticationServices

@MainActor
class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var showErrorMessage: Bool = false
    
    @Injected(\.authenticationProvider) private var authenticationProvider
    private var currentNonce: String?
    
    func singUp() {
        guard validateFields() else { return }
        showErrorMessage = false
        Task {
            do {
                try await authenticationProvider.signUp(email: email, password: password)
                showErrorMessage = false
            } catch let error as SignUpError {
                switch error {
                case .signUpFailed:
                    print(error.localizedDescription)
                default:
                    showErrorMessage(with: error.localizedDescription)
                }
            }
        }
    }
    
    func signUpGoogle() {
        Task {
            guard let presentingViewController = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first?.rootViewController else {
                 return
            }
            do {
                try await authenticationProvider.signInGoogle(withPresenting: presentingViewController)
                print("Log in Google Success")
            } catch {
                print(error)
            }
        }
    }
    
    func signUpApple(result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let authorization):
            Task {
                do {
                    try await authenticationProvider.signInApple(authorization: authorization, rawNonce: currentNonce)
                    print("Log in Apple Success")
                    currentNonce = nil
                } catch {
                    print(error)
                }
            }
        case .failure(let error):
            print(error)
            currentNonce = nil
        }
    }
    
    func configureAppleSignUpRequest(request: ASAuthorizationAppleIDRequest) {
        let nonce = CryptoHelper.randomNonceString()
        currentNonce = nonce
        request.nonce = CryptoHelper.sha256(nonce)
        request.requestedScopes = [.email]
    }
    
    private func validateFields() -> Bool {
        guard !email.isEmpty else {
            showErrorMessage(with: Localization.SignUp.Error.emailEmpty)
            return false
        }
        guard !password.isEmpty else {
            showErrorMessage(with: Localization.SignUp.Error.passwordEmpty)
            return false
        }
        return true
    }
    
    private func showErrorMessage(with message: String) {
        errorMessage = message
        showErrorMessage = true
    }
}
