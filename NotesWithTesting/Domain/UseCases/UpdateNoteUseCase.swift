//
//  UpdateNoteUseCase.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 14/3/24.
//

import Foundation

protocol UpdateNoteProtocol {
    func updateNote(id: UUID, title: String, text: String) throws
}

struct UpdateNoteUseCase: UpdateNoteProtocol {
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func updateNote(id: UUID, title: String, text: String) throws {
        try notesDatabase.update(identifier: id, title: title, text: text)
    }
}
