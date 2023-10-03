//
//  FirebaseAuthenticationProvider.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 26/09/23.
//

import FirebaseAuth

struct FirebaseAuthenticationProvider: AuthenticationProviding {
    
    let auth = Auth.auth()
    
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
                throw AuthenticationError.emailNotVerified
            }
        } catch {
            throw AuthenticationError.signInFailed(String(describing: error))
        }
    }
}
