//
//  RankingPlayerView.swift
//  Levels
//
//  Created by Nicolas Märki on 16.09.23.
//

import SwiftUI

struct RankingPlayerView: View {
    let firstName: String
    let codeName: String
    let score: String
    var body: some View {
        HStack {
            Image(ImageResource.player)
                .clipShape(Circle())
                .shadow(radius: 10)

            VStack(alignment: .leading) {
                Text(firstName).font(.headline)
                Text(codeName).font(.caption)
            }
            Spacer()
            Text(score)
        }
    }
}

#Preview {
    RankingPlayerView(firstName: "Nicolas", codeName: "The Teacher", score: "1000")
        .padding()
}


