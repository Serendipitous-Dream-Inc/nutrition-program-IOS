//
//  LaunchScreenView.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/11/23.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        AssetImages.Logos.appLogo
            .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    LaunchScreenView()
}
