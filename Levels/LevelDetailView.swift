//
//  LevelDetailView.swift
//  Levels
//
//  Created by Denis_Private on 25.09.2024.
//


import SwiftUI

struct LevelDetailView: View {
    @State private var showLevel = false
    
    var body: some View {
        ScrollView {
            
            Image(ImageResource.level)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(minWidth: 0, minHeight: 0)
                .clipped()
                .aspectRatio(2, contentMode: .fill)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
            
            HStack {
                VStack {
                    Text("Solved")
                    Text("25").font(.title.bold())
                }
                VStack {
                    Text("Failed")
                    Text("9").font(.title.bold())
                }
                Spacer()
                VStack {
                    Image(systemName: "heart").font(.title)
                    Text("8")
                }
            }.padding()
            
            
            HStack {
                Button(action: {
                    showLevel = true
                }) {
                    HStack {
                        Image(systemName: "play") // Use SF Symbols for the play icon
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                        
                        Text("Level starten")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 30)
                    .padding(.vertical, 12)
                    .background(
                        Capsule()
                            .fill(Color.black)
                    )
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            
            VStack(alignment: .leading) {
                Text("Das erste Rätsel")
                    .font(.title)
                Text("Hier wird eine kurze Beschreibung stehen. Für das erste ist es bloss Text.")
                (Text("Von ") + Text("Nicolas").bold()).font(.caption)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Material.regular)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black.opacity(0.3), radius: 5)
            .padding()
            
            Spacer()
        }
        
        .background {
            Image(ImageResource.level)
                .blur(radius: 20)
                .opacity(0.2)
        }
        
        
        .fullScreenCover(isPresented: $showLevel) {
            HangmanLevelView(showLevel: $showLevel)
        }
    }
}

#Preview {
    LevelDetailView()
}
