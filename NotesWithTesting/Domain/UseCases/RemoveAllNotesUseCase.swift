//
//  RemoveAllNotesUseCase.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 15/3/24.
//

import Foundation

protocol RemoveAllNotesProtocol {
    func removeAllNotes() throws
}

struct RemoveAllNotesUseCase: RemoveAllNotesProtocol {
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func removeAllNotes() throws {
        try notesDatabase.removeAll()
    }
}
