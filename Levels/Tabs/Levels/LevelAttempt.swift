//
//  LevelAttempt.swift
//  Levels
//
//  Created by Matthias Felix on 14.10.2023.
//

import Foundation
import SwiftData

@Model
class LevelAttempt {
    @Attribute(.unique) var id: UUID
    var userId: UUID
    var levelId: String
    var successful: Bool
    var time: TimeInterval
    var start: Date

    init(
        id: UUID = UUID(),
        userId: UUID,
        levelId: String,
        successful: Bool,
        time: TimeInterval,
        start: Date
    ) {
        self.id = id
        self.userId = userId
        self.levelId = levelId
        self.successful = successful
        self.time = time
        self.start = start
    }
}
