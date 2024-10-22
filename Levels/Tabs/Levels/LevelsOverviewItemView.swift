//
//  LevelsOverviewItemView.swift
//  Levels
//
//  Created by Matthias Felix on 29.09.2023.
//

import SwiftUI

struct LevelsOverviewItemView: View {
    let level: any Level

    var body: some View {
        VStack(alignment: .center) {
            level.titleImage
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding(5)

            Text(level.title).font(.title3)
                .lineLimit(1)

            (Text("Von ") + Text(level.author).bold())
                .font(.caption)
        }
        .foregroundStyle(.foreground)
    }
}

#Preview {
    LevelsOverviewItemView(level: TextLevel())
}
