//
//  NotesViewModel.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 9/3/24.
//

import Foundation


final class NotesViewModel: ObservableObject {
    @Published var notes: [Note]
    var createNoteUseCase: CreateNoteUseCase
    var fetchAllNotesUseCase: FetchAllNotesUseCase
    
//    init(notes: [Note] = []) {
//        self.notes = notes
//    }
    
    init(
        notes: [Note] = [],
        createNoteUseCase: CreateNoteUseCase = CreateNoteUseCase(),
        fetchAllNotesUSeCase: FetchAllNotesUseCase = FetchAllNotesUseCase()
    ) {
        self.notes = notes
        self.createNoteUseCase = createNoteUseCase
        self.fetchAllNotesUseCase = fetchAllNotesUSeCase
        
        fetchAllNotes()
//        Task {
//            await fetchAllNotes()
//        }
    }
//
    func createNote(title: String, text: String)  {
        //        let note: Note = .init(title: title, text: text, createdAt: .now)
        //
        //        notes.append(note)
        
        do {
            try createNoteUseCase.createNote(title: title, text: text)
            fetchAllNotes()
        } catch {
            print(error.localizedDescription)
        }
    }
    func fetchAllNotes()  {
            do {

                notes = try fetchAllNotesUseCase.fetchAll()
            } catch {
                print(error.localizedDescription)
            }
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
 
