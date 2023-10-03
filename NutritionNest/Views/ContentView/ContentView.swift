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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
