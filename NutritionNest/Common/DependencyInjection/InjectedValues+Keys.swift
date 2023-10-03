//
//  InjectedValues+Keys.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 02/10/23.
//

struct AuthenticationProviderKey: InjectionKey {
    static var currentValue: AuthenticationProviding = FirebaseAuthenticationProvider()
}

extension InjectedValues {
    var authenticationProvider: AuthenticationProviding {
        get { Self[AuthenticationProviderKey.self] }
        set { Self[AuthenticationProviderKey.self] = newValue }
    }
}
