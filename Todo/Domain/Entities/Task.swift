//
//  Task.swift
//  Todo
//
//  Created by Percy Pham on 2025-04-29.
//

import SwiftUI

struct Task: Codable, Hashable, Identifiable {
    var id: UUID
    var title: String
    var date: Date
    var isCompleted: Bool
    
    init(id: UUID = .init(), title: String, date: Date, isCompleted: Bool = false) {
        self.id = id
        self.title = title
        self.date = date
        self.isCompleted = isCompleted
    }
}
