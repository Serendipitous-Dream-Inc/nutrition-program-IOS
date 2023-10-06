//
//  OrText.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 05/10/23.
//

import SwiftUI

struct OrText: View {
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 100, height: 2)
            Text("Or")
                .font(.custom.inter.font(size: 15, relativeTo: .subheadline))
                .padding(.horizontal, 12)
                .background(Color.asset.background)
        }
    }
}

#Preview {
    OrText()
}
