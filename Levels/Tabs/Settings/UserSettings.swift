import Foundation
import SwiftUI

@Observable
class UserSettings: ObservableObject {
    static let shared = UserSettings()

    private init() {}

    static let userDefaultsKeyName = "levels.user-settings.name"
    static let userDefaultsKeyNickname = "levels.user.settings.nickname"
    static let userDefaultsKeyUserId = "levels.user-settings.userId"

    var name: String {
        get {
            UserDefaults.standard.string(forKey: Self.userDefaultsKeyName) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Self.userDefaultsKeyName)
        }
    }

    var nickname: String {
        get {
            UserDefaults.standard.string(forKey: Self.userDefaultsKeyNickname) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Self.userDefaultsKeyNickname)
        }
    }

    var userId: UUID {
        get {
            if let uuidString = UserDefaults.standard.string(forKey: Self.userDefaultsKeyUserId),
               let uuid = UUID(uuidString: uuidString) {
                return uuid
            } else {
                let newUUID = UUID()
                UserDefaults.standard.set(newUUID.uuidString, forKey: Self.userDefaultsKeyUserId)
                return newUUID
            }
        }
    }

    var alwaysUseDarkMode = false
}
