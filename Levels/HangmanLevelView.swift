//
//  HangmanLevelView.swift
//  Levels
//
//  Created by Matthias Felix on 22.09.2023.
//

import SwiftUI

private let asciiHangman = [
        """
           +-------+
           |
           |
           |
           |
           |
        ==============
        """
        ,
        """
           +-------+
           |       |
           |
           |
           |
           |
        ==============
        """
        ,
        """
           +-------+
           |       |
           |       0
           |
           |
           |
        ==============
        """
        ,
        """
           +-------+
           |       |
           |       0
           |       |
           |
           |
        ==============
        """
        ,
        """
           +-------+
           |       |
           |       0
           |      -|
           |
           |
        ==============
        """
        ,
        """
           +-------+
           |       |
           |       0
           |      -|-
           |
           |
        ==============
        """
        ,
        """
           +-------+
           |       |
           |       0
           |      -|-
           |      /
           |
        ==============
        """
        ,
        """
           +-------+
           |       |
           |       0
           |      -|-
           |      / \\
           |
        ==============
        """]

private let wordList = [
    "Blumen",
    "Drache",
    "Ernten",
    "Fallen",
    "Felsen",
    "Ferien",
    "Fische",
    "Fliege",
    "Gabeln",
    "Galgen",
    "Garage",
    "Gebote",
    "Kissen",
    "Kugeln",
    "Lachen",
    "Laufen",
    "Mutter",
    "Narren",
    "Orange",
    "Palast",
    "Pfanne",
    "Planen",
    "Quelle",
    "Sonnen",
    "Steuer",
    "Teller",
    "Wasser",
    "Wolken",
]

struct HangmanLevelView: View {
    @Binding var showLevel: Bool
    @State private var remainingTries = 7
    @State private var guessedLetters = Set<Character>()
    @State private var text = ""

    private let wordToGuess: [Character] = wordList.randomElement()!.uppercased().map { $0 }
    
    private var calculatedWord: [Character] {
        wordToGuess.map { guessedLetters.contains($0) ? $0 : "_" }
    }
    
    var body: some View {
        VStack {
            // Navigation Close Button
            Button("Schliessen") {
                showLevel = false
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 8)
            
            Text("Hangman")
                .font(.title)
            
            // Hangman Image
            Text(asciiHangman[7 - remainingTries])
                .font(.system(size: 20, design: .monospaced))
                .padding()
                .background(Color.orange.gradient.opacity(0.9))
            
            VStack() {
                // Game Status
                Text("Verbleibende Versuche: \(remainingTries)")
                
                Text("Bereits geraten: \(guessedLetters.sorted().map { String($0) }.joined(separator: " "))")
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Material.regular)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black.opacity(0.3), radius: 5)
            
            
            // Word Display
            HStack {
                ForEach(calculatedWord, id: \.self) { letter in
                    Text(String(letter))
                        .font(.title)
                        .frame(minWidth: 20)
                        .background((letter == "_" ? Color.red : Color.mint).opacity(0.5))
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            
            // Input and Button
            HStack {
                Text("Buchstabe:")
                TextField("Buchstabe", text: $text)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(maxWidth: 50)
                
                Button("Raten") {
                    evaluateGuess()
                }
                .disabled(text.isEmpty)
            }
            .padding()
            
            Spacer()
            
            // Win or Lose Conditions
            if remainingTries == 0 {
                Text("Verloren! Das gesuchte Wort war: \(String(wordToGuess))")
                    .foregroundColor(.red)
            } else if !calculatedWord.contains("_") {
                Text("Gewonnen!")
                    .foregroundColor(.green)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)

    }

    private func evaluateGuess() {
        guard let guess = text.uppercased().first, text.count == 1 else {
            text = ""
            return
        }
        
        text = ""
        
        if guessedLetters.contains(guess) {
            return
        }
        
        guessedLetters.insert(guess)
        
        if !wordToGuess.contains(guess) {
            remainingTries -= 1
        }
    }
}

#Preview {
    HangmanLevelView(showLevel: .constant(true))
}
