import SwiftUI

//
//  RankingPlayerView.swift
//  Levels
//
//  Created by Denis_Private on 25.09.2024.
//



struct RankingPlayerView: View {
    let firstName: String
    let codeName: String
    let score: String
    
    var body: some View {
        HStack {
            Image("PlayerImage")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .shadow(radius: 10)
                .frame(width: 50, height: 50)
            
            VStack(alignment: .leading) {
                Text(firstName)
                    .font(.headline)
                Text(codeName)
                    .font(.caption)
                Spacer(minLength: 10)
                Text("Score: \(score)")
                    .font(.caption)
            }
            .padding(.leading, 10)
        }
        .padding()
    }
}


#Preview {
    RankingPlayerView(firstName: "Alice", codeName: "TheBoss", score: "95")
}
