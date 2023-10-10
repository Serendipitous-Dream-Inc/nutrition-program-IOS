//
//  AuthenticationProviding.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 26/09/23.
//

import Foundation

enum SignInError: Error {
    case signInFailed(_ reason: String)
    case emailNotVerified
    /// Indicates that the user hasn't finished registration 
    case needsToCompleteRegistration
}

enum SignUpError: Error {
    case signUpFailed(_ reason: String)
    /// Indicates that the email already exists.
    case emailAlreadyInUse
    /// Indicates the email address is malformed.
    case invalidEmail
}

protocol AuthenticationProviding {
    /// Attemps to singOut of the users account
    func signOut()
    /// Attemps to SignIn into the users account using email and password
    ///
    /// - Parameters:
    ///     - email: the user’s email
    ///     - password: the user’s password
    ///
    /// - Throws: SignInError.emailNotVerified.
    ///     SignUpError.signInFailed(reason).
    func signIn(email: String, password: String) async throws
    /// Attemps to SingUp  into the users account using email and password
    ///
    /// - Parameters:
    ///     - email: the user’s email
    ///     - password: the user’s password
    ///
    /// - Throws: SignUpError.emailAlreadyInUse.
    ///     SignUpError.invalidEmail.
    ///     SignUpError.signUpFailed(reason).
    func signUp(email: String, password: String) async throws
}
