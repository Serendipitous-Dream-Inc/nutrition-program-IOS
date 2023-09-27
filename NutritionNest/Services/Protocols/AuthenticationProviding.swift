//
//  AuthenticationProviding.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 26/09/23.
//

import Foundation

enum AuthenticationError: Error {
    case signInFailed
    case registerFailed
    case emailNotVerified
    case emailAlreadyInUse
    case invalidEmail
    case needsToCompleteRegistration
}

protocol AuthenticationProviding {
    func signOut()
    func signIn(email: String, password: String) async throws
}
