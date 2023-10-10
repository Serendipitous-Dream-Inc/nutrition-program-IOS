//
//  FirebaseAuthenticationProvider.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 26/09/23.
//

import FirebaseAuth

struct FirebaseAuthenticationProvider: AuthenticationProviding {
    
    let auth = Auth.auth()
    @Injected(\.emailProvider) var emailProvider
    
    var user: User? {
        guard let firebaseUser = auth.currentUser else { return nil }
        guard let email = firebaseUser.email else { preconditionFailure("User email can't be nil") }
        return User(id: firebaseUser.uid, email: email, isEmailVerified: firebaseUser.isEmailVerified)
    }
    
    func signOut() {
        do {
            try auth.signOut()
        } catch let signOutError as NSError {
            print("Error signing out: \(signOutError)")
        }
    }
    
    func signIn(email: String, password: String) async throws {
        do {
            let result = try await auth.signIn(withEmail: email, password: password)
            guard result.user.isEmailVerified else {
                throw SignInError.emailNotVerified
            }
        } catch {
            throw SignInError.signInFailed(String(describing: error))
        }
    }
    
    func signUp(email: String, password: String) async throws {
        do {
            try await auth.createUser(withEmail: email, password: password)
            guard let user else { throw SignUpError.signUpFailed("User can't be nil") }
            emailProvider.sendEmailConfirmation(to: user)
        } catch let error as NSError {
            let authError = AuthErrorCode(_nsError: error)
            switch authError.code {
            case .invalidEmail: 
                throw SignUpError.invalidEmail
            case .emailAlreadyInUse:
                throw SignUpError.emailAlreadyInUse
            default: throw SignUpError.signUpFailed(String(describing: error))
            }
        }
    }
}
