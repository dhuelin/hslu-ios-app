//
//  UserSettings.swift
//  Levels
//
//  Created by Matthias Felix on 29.09.2023.
//

import Foundation
import SwiftUI

@Observable class UserSettings {
    static let shared = UserSettings()
    
    private init() {}

    var name = ""
    var nickName = ""
    var alwaysUseDarkMode = false
}
