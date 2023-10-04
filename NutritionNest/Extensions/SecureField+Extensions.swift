//
//  SecureField+Extensions.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 04/10/23.
//

import SwiftUI

extension SecureField {
    func primaryTextFieldStyle() -> some View {
        self.modifier(PrimaryTextFieldModifier())
    }
}
