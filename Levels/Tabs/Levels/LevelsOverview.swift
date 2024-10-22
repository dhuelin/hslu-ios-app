//
//  LevelsOverview.swift
//  Levels
//
//  Created by Matthias Felix on 29.09.2023.
//

import SwiftUI
import SwiftData

struct LevelsOverview: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 150, maximum: 200))]) {
                    ForEach(LevelProvider.allLevels, id: \.id) { level in
                        NavigationLink {
                            LevelDetailView(level: level)
                        } label: {
                            LevelsOverviewItemView(level: level)
                        }
                    }
                }
            }
            .navigationTitle("Levels")
        }
    }
}

#Preview {
    LevelsOverview()
}
