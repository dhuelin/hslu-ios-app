import Foundation
import SwiftData

@MainActor class SwiftDataManager {
    static let shared = SwiftDataManager()

    let modelContainer = try! ModelContainer(for: LevelAttempt.self)

    private init() {}

    // Save the LevelAttempt by inserting it into the main context and saving the context
    func saveAttempt(attempt: LevelAttempt)  {
        do {
            modelContainer.mainContext.insert(attempt)
            try modelContainer.mainContext.save()
        } catch {
            print("Failed to save LevelAttempt: \(error)")
        }
    }
}
