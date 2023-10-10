//
//  InjectedValues+Keys.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 02/10/23.
//

struct AuthenticationProviderKey: InjectionKey {
    static var currentValue: AuthenticationProviding = FirebaseAuthenticationProvider()
}

struct EmailProviderKey: InjectionKey {
    static var currentValue: EmailProviding = EmailProvider()
}

extension InjectedValues {
    var authenticationProvider: AuthenticationProviding {
        get { Self[AuthenticationProviderKey.self] }
        set { Self[AuthenticationProviderKey.self] = newValue }
    }
    
    var emailProvider: EmailProviding {
        get { Self[EmailProviderKey.self] }
        set { Self[EmailProviderKey.self] = newValue }
    }
}
