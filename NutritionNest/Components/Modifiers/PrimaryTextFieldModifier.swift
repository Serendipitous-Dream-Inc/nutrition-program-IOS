//
//  PrimaryTextFieldModifier.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 04/10/23.
//

import SwiftUI

struct PrimaryTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .textFieldStyle(.plain)
            .frame(height: 45)
            .padding(.horizontal, 13)
            .background {
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.white)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(AssetColors.gray2, lineWidth: 1)
                    }
            }
            .font(CustomFonts.inter.font(size: 15, relativeTo: .subheadline))
    }
}
