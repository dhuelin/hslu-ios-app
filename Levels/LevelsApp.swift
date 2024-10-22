//
//  LevelsApp.swift
//  Levels
//
//  Created by Nicolas Märki on 31.08.2024.
//

import SwiftUI

@main
struct LevelsApp: App {
    @State private var userSettings = UserSettings.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(userSettings)
                .preferredColorScheme(userSettings.alwaysUseDarkMode ? .dark : nil)
        }
    }
}
