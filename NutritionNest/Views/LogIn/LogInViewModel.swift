//
//  LogInViewModel.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 04/10/23.
//

import SwiftUI

class LogInViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
}
