//
//  NavigationManager.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/11/23.
//

import SwiftUI

enum PresentingViewState {
    case launchScreenView
    case onBoardingView
    case journalView
}

class NavigationManager: ObservableObject {
    @Published var presentingViewState: PresentingViewState = .launchScreenView
    @Injected(\.authenticationProvider) var authenticationProvider
    
    func onAppear() {
        if authenticationProvider.user == nil {
            presentingViewState = .onBoardingView
        }
    }
}
