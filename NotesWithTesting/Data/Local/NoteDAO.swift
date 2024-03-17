//
//  NoteDAO.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 13/3/24.
//

import Foundation
import SwiftData

@Model
class NoteDAO: Identifiable, Hashable {
    @Attribute(.unique)
    var identifier: UUID
    var title: String
    var text: String?
    var createdAt: Date

    init(identifier: UUID, title: String, text: String?, createdAt: Date) {
        self.identifier = identifier
        self.title = title
        self.text = text
        self.createdAt = createdAt
    }
}
