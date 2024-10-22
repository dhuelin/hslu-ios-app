//
//  SettingsView.swift
//  Levels
//
//  Created by Matthias Felix on 29.09.2023.
//

import SwiftUI

struct SettingsView: View {
    @Environment(UserSettings.self) private var userSettings

    var body: some View {
        @Bindable var userSettings = userSettings

        NavigationStack {
            Form {
                Section("User") {
                    TextField("Username", text: $userSettings.name)
                    TextField("Nickname", text: $userSettings.nickName)
                }

                Section("Erscheinungsbild") {
                    Toggle("Immer Dark Mode verwenden", isOn: $userSettings.alwaysUseDarkMode)
                }
            }
            .navigationTitle("Einstellungen")
        }
    }
}

#Preview {
    SettingsView()
        .environment(UserSettings.shared)
}
