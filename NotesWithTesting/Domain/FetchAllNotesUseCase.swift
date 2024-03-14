//
//  FetchAllNotesUseCase.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 13/3/24.
//

import Foundation

protocol FetchAllNotesProtocol {
    func fetchAll() throws -> [Note]
}

struct FetchAllNotesUseCase: FetchAllNotesProtocol {
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func fetchAll() throws -> [Note] {
        try notesDatabase.fetchAll().map { Note(title: $0.title, text: $0.text, createdAt: $0.createdAt) }
    }
}
