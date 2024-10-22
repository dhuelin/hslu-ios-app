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

struct HangmanLevel: Level {

    let id: String = "levels.felix.hangman"
    let title: String = "Hangman"
    let author: String = "Matthias"
    let description: String = "Pass auf dich auf!"
    let titleImage: Image = Image(ImageResource.level)

    @Environment(\.dismiss) private var dismiss

    @State private var guessedLetters: Set<Character> = []
    @State private var remainingTries = 7
    @State private var text = ""

    private let wordToGuess: [Character] = wordList.randomElement()!.uppercased().map { $0 }

    private var calculatedWord: [Character] {
        wordToGuess.map {
            if guessedLetters.contains($0) {
                return $0
            } else {
                return "_"
            }
        }
    }

    var body: some View {
        VStack {
            Button {
                dismiss()
            } label: {
                Text("Schliessen")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 8)
            Text("Hangman")
                .font(.title)
            Spacer()
                .frame(height: 10)
            Text(asciiHangman[7 - remainingTries])
                .minimumScaleFactor(0.2)
                .font(.system(size: 28))
                .bold()
                .monospaced()
                .padding(10)
                .background {
                    RoundedRectangle(cornerRadius: 15)
                        .fill(.orange.gradient.opacity(0.75))
                        .shadow(radius: 10)
                }
            Spacer()
                .frame(height: 10)
            VStack(alignment: .leading) {
                Text("Verbleibende Versuche: \(remainingTries)")
                Text("Bereits geraten: ") + Text("\(guessedLetters.map { "\($0)" }.joined(separator: " "))")
                if wordToGuess == calculatedWord {
                    Text("🎉 Geschafft, bravo! 🎉")
                        .foregroundStyle(.green)
                        .bold()
                } else if remainingTries == 0 {
                    Text("😟Leider nicht geschafft... 😟.\nGesuchtes Wort: \(String(wordToGuess))")
                        .foregroundStyle(.red)
                        .bold()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(10)
            .background(Material.regular)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .shadow(color: .black.opacity(0.3), radius: 5)
            .padding(10)
            Spacer()
                .frame(height: 10)
            HStack {
                ForEach(Array(calculatedWord.enumerated()), id: \.offset) { idx, c in
                    Text(String(c))
                        .font(.title2)
                        .bold()
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 3)
                                .fill(.white)
                                .stroke(c == "_" ? .red : .green, lineWidth: 1.5)
                                .shadow(color: .black.opacity(0.3), radius: 3)
                        }
                }
            }
            .padding(.horizontal)
            Spacer()
                .frame(height: 12)
            HStack {
                Text("Buchstabe:")
                TextField("", text: $text)
                    .textFieldStyle(.roundedBorder)
                    .font(.title2)
                    .bold()
                    .frame(width: 45)
                    .onSubmit {
                        evaluateGuess()
                    }
                Button("Raten") {
                    evaluateGuess()
                }
                .buttonStyle(.borderedProminent)
                .onChange(of: text) { oldValue, newValue in
                    text = newValue.uppercased()
                    if newValue.count > 1 {
                        text = oldValue
                    }
                }
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
    }

    private func evaluateGuess() {
        guard let first = text.first else { return }

        if !wordToGuess.contains(first), !guessedLetters.contains(first) {
            remainingTries -= 1
        }
        guessedLetters.insert(first)
        text = ""
    }
}

#Preview {
    HangmanLevel()
}
