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
}

// MARK: Implementation
extension Localization {
    private static func tr(_ key: String, fallback value: String) -> String {
        return NSLocalizedString(key, value: value, comment: "Localized")
    }
}
