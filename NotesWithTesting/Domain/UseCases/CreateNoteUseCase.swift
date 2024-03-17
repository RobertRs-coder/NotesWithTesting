//
//  CreateNoteUseCase.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 13/3/24.
//

import Foundation

protocol CreateNoteProtocol {
    func createNote(title: String, text: String) throws
}

struct CreateNoteUseCase: CreateNoteProtocol {
    var notesDatabase: NotesDatabaseProtocol
    
    init(notesDatabase: NotesDatabaseProtocol = NotesDatabase.shared) {
        self.notesDatabase = notesDatabase
    }
    
    func createNote(title: String, text: String) throws {
        let note: Note = .init(id: .init(),title: title, text: text, createdAt: .now)
        
        try notesDatabase.insert(note: NoteDAO(identifier: note.id,title: note.title, text: note.text, createdAt: note.createdAt))
    }
}



