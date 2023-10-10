//
//  EmailProvider.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 10/10/23.
//

import FirebaseAuth

struct EmailProvider: EmailProviding {
    func sendEmailConfirmation(to user: User) {
        // Using firebase default email sender
        guard let firebaseUser = Auth.auth().currentUser else {
            return
        }
        firebaseUser.sendEmailVerification()
    }
}
