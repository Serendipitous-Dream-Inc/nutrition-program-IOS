//
//  ProviderButton.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 05/10/23.
//

import SwiftUI

struct ProviderButton: View {
    
    let image: Image
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            image
                .frame(height: 46)
                .frame(maxWidth: .infinity)
                .background()
                .cornerRadius(8)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .inset(by: 0.5)
                        .stroke(AssetColors.gray2, lineWidth: 1.0)
                }
        })
    }
}

#Preview {
    ProviderButton(image: AssetImages.Logos.appleLogo, action: {})
}
