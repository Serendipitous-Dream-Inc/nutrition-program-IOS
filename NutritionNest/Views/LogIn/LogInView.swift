//
//  LogInView.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 20/09/23.
//

import SwiftUI

struct LogInView: View {
    var body: some View {
        ZStack {
            Color.assetColors.background
                .ignoresSafeArea()
            VStack(spacing: 0) {
                Text("NutritionNest")
                    .font(.custom.inter.font(size: 25, relativeTo: .title))
                    .fontWeight(.bold)
                    .padding(.top, 32)
                Text("Our AI friend is excited to assist you on your health journey!")
                    .font(.custom.inter.font(size: 15, relativeTo: .subheadline))
                    .padding(.top, 10)
            }
            .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}
