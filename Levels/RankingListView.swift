import SwiftUI
//
//  RankingListView.swift
//  Levels
//
//  Created by Denis_Private on 25.09.2024.
//


struct RankingListView: View {

        var body: some View {
            NavigationStack {
                List {
                    RankingPlayerView(firstName: "Alice", codeName: "TheBoss", score: "95")
                    RankingPlayerView(firstName: "Bob", codeName: "TheBuilder", score: "90")
                    RankingPlayerView(firstName: "Charlie", codeName: "Chaplin", score: "85")
                }
                .navigationTitle("Ranking")
            }
        }
}


#Preview {
    RankingListView()
}
