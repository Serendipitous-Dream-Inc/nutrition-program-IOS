//
//  Localization+Constans.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 22/09/23.
//

import Foundation

enum Localization {
    enum Onboarding {
        static let welcome = Localization.tr("Onboarding.Welcome", fallback: "Welcome to NutritionNest")
        static let signup = Localization.tr("Onboarding.Signup", fallback: "Sounds good. Lets Sign up!")
        static let account = Localization.tr("Onboarding.Account", fallback: "Have an account?")
        static let login = Localization.tr("Onboarding.Login", fallback: "Log In")
    }
    enum SignUp {
        static let title = Localization.tr("SignUp.Title", fallback: "NutritionNest")
        static let message = Localization.tr("SignUp.Message", fallback: "Our AI friend is excited to assist you on your health journey!")
        enum Prompt {
            static let email = Localization.tr("SignUp.Prompt.Email", fallback: "Email")
            static let password = Localization.tr("SignUp.Prompt.Password", fallback: "Password")
        }
        enum Button {
            static let signUp = Localization.tr("SignUp.Button.SignUp", fallback: "Sign Up")
        }
        enum Error {
            static let emailAlreadyInUse = Localization.tr("SignUp.Error.EmailAlreadyInUse", fallback: "Email already in use")
            static let invalidEmail = Localization.tr("SignUp.Error.InvalidEmail", fallback: "Invalid email format")
            static let weakPassword = Localization.tr("SignUp.Error.WeakPassword", fallback: "The password must be 6 characters long or more")
            static let emailEmpty = Localization.tr("SignUp.Error.EmailEmpty", fallback: "Email can't be empty")
            static let passwordEmpty = Localization.tr("SignUp.Error.PasswordEmpty", fallback: "Password can't be empty")
        }
    }
}

// MARK: Implementation
extension Localization {
    private static func tr(_ key: String, fallback value: String) -> String {
        return NSLocalizedString(key, value: value, comment: "Localized")
    }
}
