//
//  SignInViewModel.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 04/10/23.
//

import SwiftUI

@MainActor
class SignInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var showErrorMessage: Bool = false
    
    @Injected(\.authenticationProvider) private var authenticationProvider
    
    func logIn() {
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
    
    func logInGoogle() {
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
    
    func validateFields() -> Bool {
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
    
    func showErrorMessage(with message: String) {
        errorMessage = message
        showErrorMessage = true
    }
}
