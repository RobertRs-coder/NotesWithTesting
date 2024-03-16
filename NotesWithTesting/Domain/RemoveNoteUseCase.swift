//
//  RemoveNoteUseCase.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 15/3/24.
//

import Foundation

import Foundation

protocol RemoveNoteProtocol {
    func removeNote(id: UUID) throws
}

struct RemoveNoteUseCase: RemoveNoteProtocol {
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func removeNote(id: UUID) throws {
        try notesDatabase.remove(identifier: id)
    }
}
