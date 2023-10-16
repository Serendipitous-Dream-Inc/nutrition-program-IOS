//
//  Log.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 14/10/23.
//

import Foundation

struct Log {
    /// Print a log message that won't be shipped to production
    ///
    /// - Parameter message: A message to show in the console
    static func print(_ message: String) {
        #if DEBUG
        
        #endif
    }
}
