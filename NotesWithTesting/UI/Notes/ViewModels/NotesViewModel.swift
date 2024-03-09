//
//  NotesViewModel.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 9/3/24.
//

import Foundation


final class NotesViewModel: ObservableObject {
    @Published var notes: [Note]
    
    init(notes: [Note] = []) {
        self.notes = notes
    }
    
    func createNote(title: String, text: String) {
        let note: Note = .init(title: title, text: text, createdAt: .now)
        
        notes.append(note)
    }
    
    func updateNote(id: UUID, newTitle: String, newText: String?) {
        
        if let index = notes.firstIndex(where: { $0.id == id }) {
            let updatedNote = Note(id: id, title: newTitle, text: newText, createdAt: .now)
            notes[index] = updatedNote
        }
    }
    
    func removeNote(id: UUID) {
        notes.removeAll(where: { $0.id == id })
    }
}
 
