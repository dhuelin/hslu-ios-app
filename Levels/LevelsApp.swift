//
//  LevelsApp.swift
//  Levels
//
//  Created by Nicolas Märki on 31.08.2024.
//

import SwiftUI

@main
struct LevelsApp: App {
    @StateObject private var userSettings = UserSettings.shared
    @StateObject private var levelState = LevelState()


    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userSettings)
                .environmentObject(levelState)
                .modelContainer(SwiftDataManager.shared.modelContainer)
                .preferredColorScheme(userSettings.alwaysUseDarkMode ? .dark : nil)
        }
    }
}
