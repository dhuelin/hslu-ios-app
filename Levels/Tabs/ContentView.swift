//
//  ContentView.swift
//  Levels
//
//  Created by Nicolas Märki on 31.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            LevelsOverview()
                .tabItem {
                    Label("Levels", systemImage: "checklist")
                }
            RankingListView()
                .tabItem {
                    Label("Ranking", systemImage: "star")
                }
            SettingsView()
                .tabItem {
                    Label("Einstellungen", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
