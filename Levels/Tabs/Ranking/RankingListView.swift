//
//  RankingListView.swift
//  Levels
//
//  Created by Nicolas Märki on 16.09.23.
//

import SwiftUI

struct RankingListView: View {
    var body: some View {
        NavigationStack {
            List {
                RankingPlayerView(firstName: "Ruedi", codeName: "The Professor", score: "1000")
                RankingPlayerView(firstName: "Matthias", codeName: "The Expert", score: "900")
                RankingPlayerView(firstName: "Nicolas", codeName: "The Starter", score: "300")
            }
            .navigationTitle("Ranking")
        }
    }
}

#Preview {
    RankingListView()
}
