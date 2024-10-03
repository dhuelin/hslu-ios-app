import SwiftUI


struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: RankingListView()) {
                        Text("Player Rankings")
                }
                NavigationLink(destination: LevelDetailView()) {
                    Text("View Level Details")
                }
            }
            .navigationTitle("Menu")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
