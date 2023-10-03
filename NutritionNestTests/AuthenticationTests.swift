//
//  AuthenticationTests.swift
//  NutritionNestTests
//
//  Created by Pedro Ésli Vieira do Nascimento on 02/10/23.
//

import XCTest
@testable import NutritionNest

final class AuthenticationTests: XCTestCase {
    
    @Injected(\.authenticationProvider) var authenticationProvider

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSignIn() async throws {
        let email = "test_user@serendipitousdream.org"
        let password = "test_user123"
        try await authenticationProvider.signIn(email: email, password: password)
        print("SignIn successful")
    }
}
