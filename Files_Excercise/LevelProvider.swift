//
//  LevelProvider.swift
//  Levels
//
//  Created by Nicolas Märki on 09.09.2024.
//

@MainActor
class LevelProvider {
    static let allLevels: [any Level] = [
        TextLevel(),
        ToggleLevel(),
        HangmanLevel(),
    ]
}
