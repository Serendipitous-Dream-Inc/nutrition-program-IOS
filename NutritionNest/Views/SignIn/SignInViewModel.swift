//
//  SignInViewModel.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 04/10/23.
//

import SwiftUI
import AuthenticationServices

@MainActor
class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var showErrorMessage: Bool = false
    
    @Injected(\.authenticationProvider) private var authenticationProvider
    private var currentNonce: String?
    
    func signIn() {
        guard validateFields() else { return }
        showErrorMessage = false
        Task {
            do {
                try await authenticationProvider.signIn(email: email, password: password)
                showErrorMessage = false
                print("Log in Success")
            } catch let error as SignInError {
                switch error {
                case .signInFailed:
                    showErrorMessage(with: Localization.LogIn.Error.invalidCredentials)
                default:
                    showErrorMessage(with: error.localizedDescription)
                }
            }
        }
    }
    
    func signInGoogle() {
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
    
    func signInApple(result: Result<ASAuthorization, Error>) {
        switch result {
        case .success(let authorization):
            Task {
                do {
                    guard let rawNonce = currentNonce else {
                        fatalError("Invalid state: A login callback was received, but no login request was sent.")
                    }
                    try await authenticationProvider.signInApple(authorization: authorization, rawNonce: rawNonce)
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
    
    func signInFacebook() {
        Task {
            do {
                try await authenticationProvider.signInFacebook()
                print("Log in Facebook Success")
            } catch {
                print(error)
            }
        }
    }
    
    func configureAppleSignInRequest(request: ASAuthorizationAppleIDRequest) {
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
