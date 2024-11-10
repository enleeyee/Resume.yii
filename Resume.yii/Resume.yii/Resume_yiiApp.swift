//
//  Resume_yiiApp.swift
//  Resume.yii
//
//  Created by Enlai Yii on 10/24/24.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseAuth

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct Resume_yiiApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var viewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
                .environmentObject(viewModel)
        }
    }
}
