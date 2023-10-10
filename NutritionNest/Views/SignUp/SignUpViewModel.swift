//
//  SignUpViewModel.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 04/10/23.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errorMessage: String = ""
    @Published var showErrorMessage: Bool = false
    
    @Injected(\.authenticationProvider) private var authenticationProvider
    
    func singUp() {
        guard validateFields() else { return }
        Task {
            do {
                try await authenticationProvider.signUp(email: email, password: password)
                showErrorMessage = false
            } catch let error as SignUpError {
                switch error {
                case .signUpFailed(let reason):
                    print("Sign up failed, reason: \(reason)")
                case .emailAlreadyInUse:
                    showErrorMessage(with: "Email already in use")
                case .invalidEmail:
                    showErrorMessage(with: "Invalid email format")
                }
            }
        }
    }
    
    func validateFields() -> Bool {
        guard !email.isEmpty else {
            showErrorMessage(with: "Email can't be nil")
            return false
        }
        guard !password.isEmpty else {
            showErrorMessage(with: "Password can't be nil")
            return false
        }
        return true
    }
    
    func showErrorMessage(with message: String) {
        errorMessage = message
        showErrorMessage = true
    }
}
