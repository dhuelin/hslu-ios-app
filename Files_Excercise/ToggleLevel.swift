//
//  ToggleLevel.swift
//  Levels
//
//  Created by Nicolas Märki on 13.07.23.
//

import SwiftUI

struct ToggleLevel: Level {

    let id: String = "levels.maerki.toggles"
    let title: String = "Am Schalter"
    let author: String = "Nicolas"
    let description: String = "Da gehts jetzt nur mit Logik weiter."
    let titleImage: Image = Image(ImageResource.levelImage3)

    @Environment(\.dismiss) private var dismiss

    @State private var toggle1 = false
    @State private var toggle2 = false
    @State private var toggle3 = false
    @State private var toggle4 = false
    @State private var toggle5 = false
    @State private var toggle6 = false
    @State private var toggle7 = false
    @State private var toggle8 = false

    var sum: Int {
        (toggle1 ? 1 : 0) + 2 * (toggle2 ? 1 : 0) + 4 * (toggle3 ? 1 : 0) + 8 * (toggle4 ? 1 : 0) + 16 * (toggle5 ? 1 : 0) + 32 * (toggle6 ? 1 : 0) + 64 * (toggle7 ? 1 : 0) + 128 * (toggle8 ? 1 : 0)
    }

    var body: some View {
        List {
            Section {
                if sum < 40 {
                    Text("Zu niedrig")
                }
                else if sum > 44 {
                    Text("Zu hoch")
                }
                else if sum == 42 {
                    Text("Richtig")
                }
                else {
                    Text("Nahe dran")
                }
            }
            Toggle(isOn: $toggle1, label: {
                Text("Schalter 1")
            })
            Toggle(isOn: $toggle2, label: {
                Text("Schalter 2")
            })
            Toggle(isOn: $toggle3, label: {
                Text("Schalter 3")
            })
            Toggle(isOn: $toggle4, label: {
                Text("Schalter 4")
            })
            Toggle(isOn: $toggle5, label: {
                Text("Schalter 5")
            })
            Toggle(isOn: $toggle6, label: {
                Text("Schalter 6")
            })
            Toggle(isOn: $toggle7, label: {
                Text("Schalter 7")
            })
            Toggle(isOn: $toggle8, label: {
                Text("Schalter 8")
            })
        }
        .toolbar {
            Button("Abbrechen") {
                dismiss()
            }
        }
    }
}



#Preview {
    NavigationView(content: {
        ToggleLevel()
            .toolbar {
                Button("Abbrechen") {

                }

            }
    })
}
