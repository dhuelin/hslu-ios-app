import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var userSettings: UserSettings

    var body: some View {
        TabView {
            LevelsOverview()
                .tabItem {
                    Label("Levels", systemImage: "list.bullet")
                }
            
            RankingListView()
                .tabItem {
                    Label("Ranking", systemImage: "star.fill")
                }
            
            SettingsView()
                .tabItem {
                    Label("Einstellungen", systemImage: "gearshape.fill")
                }
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(UserSettings.shared)  // Add the UserSettings object to the preview
}
