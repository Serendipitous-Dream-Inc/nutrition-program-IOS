//
//  CustomFonts+Constants.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 03/10/23.
//

import SwiftUI

enum CustomFonts {
    static let inter = CustomFont("Inter")
}

struct CustomFont {
    let name: String
    
    init(_ name: String) {
        self.name = name
    }
    
    func font(size: CGFloat) -> Font {
        Font.custom(name, size: size)
    }
    
    func font(size: CGFloat, relativeTo textStyle: Font.TextStyle) -> Font {
        Font.custom(name, size: size, relativeTo: textStyle)
    }
    
    func font(fixedSize: CGFloat) -> Font {
        Font.custom(name, fixedSize: fixedSize)
    }
}
