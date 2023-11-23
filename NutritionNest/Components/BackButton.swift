//
//  BackButton.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 23/11/23.
//

import SwiftUI

struct BackButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Image(systemName: "chevron.left")
                .bold()
                .foregroundColor(.black)
        })
    }
}

#Preview {
    BackButton(action: {})
}
