//
//  LevelState.swift
//  Levels
//
//  Created by Matthias Felix on 14.10.2023.
//

import Foundation

@MainActor
class LevelState : ObservableObject {

    struct LevelStart: Identifiable {
        let start: Date
        let level: any Level
        var id: String {
            level.id
        }
    }

    var current: LevelStart?

    func startLevel(_ level: any Level) {
        current = LevelStart(start: Date(), level: level)
    }

    func finish(successful: Bool)  {
        guard let current else { return }

        let elapsedTime = Date().timeIntervalSince(current.start)

        let attempt = LevelAttempt(userId: UserSettings.shared.userId,
                                   levelId: current.level.id,
                                   successful: successful,
                                   time: elapsedTime,
                                   start: current.start)

        SwiftDataManager.shared.saveAttempt(attempt: attempt)

        self.current = nil
    }

}
