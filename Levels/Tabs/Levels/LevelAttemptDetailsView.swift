//
//  LevelAttemptDetailsView.swift
//  Levels
//
//  Created by Matthias Felix on 16.10.2024.
//

import SwiftUI
import SwiftData
import Charts

struct LevelAttemptDetailsView: View {
    let level: any Level

    @Query private var attempts: [LevelAttempt]

    private var successfulAttempts: [LevelAttempt] {
        attempts.filter { $0.successful }
    }

    private var failedAttempts: [LevelAttempt] {
        attempts.filter { !$0.successful }
    }

    init(level: any Level) {
        self.level = level
        let id = level.id
        _attempts = Query(
            filter: #Predicate<LevelAttempt> { $0.levelId == id
            },
            sort: \.start)
    }

    var body: some View {
        if let firstAttempt = attempts.first {
            Text("Zuerst gelöst am: ")
                .bold()
                .padding(.top, 5)
            Text(firstAttempt.start, format: Date.FormatStyle(date: .abbreviated, time: .shortened))
        }
        Text("Versuche")
            .font(.headline)
            .padding(.top, 5)
        Chart {
            SectorMark(angle: .value("Erfolgreich", successfulAttempts.count),
                       innerRadius: .ratio(0.35),
                       angularInset: 2)
            .foregroundStyle(Color.green)
            .cornerRadius(5)
            .annotation(position: .overlay) {
                Text("\(successfulAttempts.count)")
                    .font(.headline)
                    .foregroundStyle(.white)
            }
            SectorMark(angle: .value("Nicht erfolgreich", failedAttempts.count),
                       innerRadius: .ratio(0.35),
                       angularInset: 2)
            .foregroundStyle(Color.red)
            .cornerRadius(5)
            .annotation(position: .overlay) {
                if failedAttempts.count > 0 {
                    Text("\(failedAttempts.count)")
                        .font(.headline)
                        .foregroundStyle(.white)
                }
            }
        }
        .chartLegend(position: .trailing)
        .chartForegroundStyleScale(["Erfolgreich": Color.green, "Nicht erfolgreich": Color.red])
    }
}

#Preview {
    LevelAttemptDetailsView(level: TextLevel())
        .environmentObject(LevelState())
        .modelContainer(SwiftDataManager.shared.modelContainer)
}
