//
//  Level.swift
//  Levels
//
//  Created by Matthias Felix on 29.09.2023.
//

import Foundation
import SwiftUI

protocol Level: View, Identifiable {
    var id: String { get }
    var title: String { get }
    var author: String { get }
    var description: String { get }
    var titleImage: Image { get }
}
