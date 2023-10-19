//
//  AuthenticationProviding.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 26/09/23.
//

import UIKit
import AuthenticationServices

enum SignInError: Error, LocalizedError {
    case signInFailed(_ reason: String)
    /// Indicates that the email has not been verified yet by the user
    case emailNotVerified
    /// Indicates the user's account is disabled
    case userDisabled
    /// Indicates the user attempted sign in with an incorrect password.
    case wrongPassword
    /// Indicates the email address is malformed
    case invalidEmail
    /// Indicates that the user hasn't finished registration
    case needsToCompleteRegistration
    
    var errorDescription: String? {
        switch self {
        case .signInFailed(let reason):
            return "Sing in failed, reason: \(reason)"
        case .emailNotVerified:
            return Localization.LogIn.Error.emailNotVerified
        case .needsToCompleteRegistration:
            return "Needs to complete registration"
        case .userDisabled:
            return Localization.LogIn.Error.userDisabled
        case .wrongPassword:
            return Localization.LogIn.Error.wrongPassword
        case .invalidEmail:
            return Localization.LogIn.Error.invalidEmail
        }
    }
}

enum SignUpError: Error, LocalizedError {
    case signUpFailed(_ reason: String)
    /// Indicates that the email already exists.
    case emailAlreadyInUse
    /// Indicates the email address is malformed.
    case invalidEmail
    /// The password must be 6 characters long or more.
    case weakPassword
    
    var errorDescription: String? {
        switch self {
        case .signUpFailed(let reason):
            return "Sign up failed, reason: \(reason)"
        case .emailAlreadyInUse:
            return Localization.SignUp.Error.emailAlreadyInUse
        case .invalidEmail:
            return Localization.SignUp.Error.invalidEmail
        case .weakPassword:
            return Localization.SignUp.Error.weakPassword
        }
    }
}

protocol AuthenticationProviding {
    /// Current logged in user
    var user: User? { get }
    
    /// Attempts to singOut of the users account
    func signOut()
    
    /// Attempts to SignIn into the users account using email and password
    ///
    /// - Parameters:
    ///     - email: The user’s email.
    ///     - password: The user’s password.
    ///
    /// - Throws: SignInError.emailNotVerified.
    ///     SignUpError.signInFailed(reason).
    func signIn(email: String, password: String) async throws
    
    /// Attempts to SignIn into the users account using Google
    ///
    /// - Parameter withPresenting: The view controller used to present  the google SignIn view.
    /// - Throws: SignInError.signInFailed(reason)
    func signInGoogle(withPresenting presentingViewController: UIViewController) async throws
    
    /// Attempts to SignIn into the users account using Apple
    ///
    /// - Parameters:
    ///     - authorization: The authorization result of Apple Sign.
    ///     - rawNonce: The raw nonce associated with the Sign in with Apple Auth credential being created.
    func signInApple(authorization: ASAuthorization, rawNonce: String) async throws
    
    /// Attempts to SignIn into the users account using Facebook
    func signInFacebook() async throws
    
    /// Attempts to SingUp  into the users account using email and password
    ///
    /// - Parameters:
    ///     - email: The user’s email.
    ///     - password: The user’s password.
    ///
    /// - Throws: SignUpError.emailAlreadyInUse.
    ///     SignUpError.invalidEmail.
    ///     SignUpError.signUpFailed(reason).
    func signUp(email: String, password: String) async throws
}
