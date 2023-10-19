//
//  AppDelegate.swift
//  NutritionNest
//
//  Created by Pedro Ésli Vieira do Nascimento on 26/09/23.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn
import FacebookCore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        // Facebook setup
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
        let googleAuthentication = GIDSignIn.sharedInstance.handle(url)
        let facebookAuthentication = ApplicationDelegate.shared.application(
            app,
            open: url,
            sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
            annotation: options[UIApplication.OpenURLOptionsKey.annotation]
        )
        return googleAuthentication || facebookAuthentication
    }
}
