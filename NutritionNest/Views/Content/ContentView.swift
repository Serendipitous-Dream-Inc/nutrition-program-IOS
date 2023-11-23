//
//  ContentView.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 20/09/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var navigationManager = NavigationManager()
    
    var body: some View {
        NavigationStack {
            if navigationManager.presentingViewState == .launchScreenView {
                LaunchScreenView()
            } else if navigationManager.presentingViewState == .onBoardingView {
                OnboardingView()
            } else {
                // TODO: Journal View
            }
        }
        .onAppear(perform: navigationManager.onAppear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
