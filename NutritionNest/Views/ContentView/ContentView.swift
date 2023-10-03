//
//  ContentView.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 20/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @Injected(\.authenticationProvider) var authenticationProvider
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .task {
            let email = "test_user@serendipitousdream.org"
            let password = "test_user123"
            do {
                try await authenticationProvider.signIn(email: email, password: password)
                print("SignIn successful")
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
