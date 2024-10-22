//
//  LevelDetailView.swift
//  Levels
//
//  Created by Nicolas Märki on 16.09.23.
//

import SwiftUI

struct LevelDetailView: View {
    @State private var showLevel = false
    let level: any Level
    @EnvironmentObject var levelState: LevelState

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                level.titleImage
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

                Button {
                    showLevel = true
                } label: {
                    Label("Level starten", systemImage: "play")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundStyle(Color.white)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 35.0)
                                .fill(Color.black)
                                .shadow(radius: 10)
                        }
                        .padding(.vertical, 10)
                }
                .frame(maxWidth: .infinity, alignment: .center)

                VStack(alignment: .leading) {
                    Text(level.title)
                        .font(.title)
                    Text(level.description)
                    (Text("Von ") + Text(level.author).bold()).font(.caption)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .background(Material.regular)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.3), radius: 5)
                .padding()
                
                LevelAttemptDetailsView(level: level)
                                    .padding()
            }
        }
        .background {
            level.titleImage
                .blur(radius: 20)
                .opacity(0.2)
        }
        .navigationTitle(level.title)
        .navigationBarTitleDisplayMode(.inline)
        .fullScreenCover(isPresented: $showLevel) {
            NavigationStack {
                AnyView(erasing: level)
            }
        }
    }
}

#Preview {
    LevelDetailView(level: TextLevel())
        .environmentObject(LevelState())
}
