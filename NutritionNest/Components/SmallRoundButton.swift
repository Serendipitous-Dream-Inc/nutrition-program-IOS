//
//  AccountButton.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 04/10/23.
//

import SwiftUI

struct SmallRoundButton: View {
    
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .font(.custom.inter.font(size: 15, relativeTo: .subheadline))
                .foregroundColor(.white)
                .bold()
                .padding(.vertical, 11)
                .frame(width: 160)
                .background(Color.accentColor)
                .cornerRadius(23)
        })
    }
}
