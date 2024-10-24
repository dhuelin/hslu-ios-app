//
//  TextLevelView.swift
//  Levels
//
//  Created by Nicolas Märki on 13.07.23.
//

import SwiftUI

struct TextLevel: Level {

    let id: String = "levels.maerki.text-quiz"
    let title: String = "Das Texträtsel"
    let author: String = "Nicolas"
    let description: String = "Besonders schwieriges Rätsel, dass viel Wissen, Erfindergeist und Geduld verlangt."
    let titleImage: Image = Image(ImageResource.levelImage2)

    
    @EnvironmentObject var levelState: LevelState
    
    @State var answer: String = ""
    var body: some View {
        List {
            Text("Ich habe Städte, aber keine Häuser. Ich habe Wälder, aber keine Bäume. Ich habe Flüsse, aber kein Wasser. Was bin ich?")

            TextField("Antwort", text: $answer)

            if answer == "Karte" {
                Text("Korrekt")
                levelState.finish(successful: true) 
            }
            else if !answer.isEmpty {
                Text("Falsch")
                levelState.finish(successful: false)
            }
        }
    }
}

#Preview {
    NavigationView {
        TextLevel()
            .environmentObject(LevelState())
    }
}
