//
//  AssetImages+Constants.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 05/10/23.
//

import SwiftUI

struct AssetImages {
    struct Logos {
        let appleLogo = Image("AppleLogo")
        let facebookLogo = Image("FacebookLogo")
        let googleLogo = Image("GoogleLogo")
        let appLogo = Image("AppLogo")
    }
    let logos = Logos()
}

extension Image {
    static let assets = AssetImages()
}
