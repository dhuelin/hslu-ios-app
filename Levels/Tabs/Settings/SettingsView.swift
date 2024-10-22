//
//  SettingsView.swift
//  Levels
//
//  Created by Matthias Felix on 29.09.2023.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("levels.user-settings.name") private var name: String = ""
    @AppStorage("levels.user-settings.nickname") private var nickname: String = ""

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("User Details")) {
                    TextField("Name", text: $name)
                    TextField("Nickname", text: $nickname)
                }
                Section(header: Text("Preferences")) {
                    Toggle("Always use Dark Mode", isOn: $userSettings.alwaysUseDarkMode)
                }
            }
            .navigationTitle("Einstellungen")
        }
    }
    
    @EnvironmentObject var userSettings: UserSettings
}

#Preview {
    SettingsView()
        .environmentObject(UserSettings.shared)
}
