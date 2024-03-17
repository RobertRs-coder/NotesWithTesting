//
//  NotesViewModel.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 9/3/24.
//

import Foundation


final class NotesViewModel: ObservableObject {
    @Published var notes: [Note]
    var createNoteUseCase: CreateNoteProtocol
    var fetchAllNotesUseCase: FetchAllNotesProtocol
    var updateNoteUseCase: UpdateNoteProtocol
    var removeNoteUseCase: RemoveNoteProtocol
    var removeAllNotesUseCase: RemoveAllNotesProtocol

    init(
        notes: [Note] = [],
        createNoteUseCase: CreateNoteProtocol = CreateNoteUseCase(),
        fetchAllNotesUseCase: FetchAllNotesProtocol = FetchAllNotesUseCase(),
        updateNoteUseCase: UpdateNoteProtocol = UpdateNoteUseCase(),
        removeNoteUseCase: RemoveNoteProtocol = RemoveNoteUseCase(),
        removeAllNotesUseCase: RemoveAllNotesProtocol = RemoveAllNotesUseCase()
    ) {
        self.notes = notes
        self.createNoteUseCase = createNoteUseCase
        self.fetchAllNotesUseCase = fetchAllNotesUseCase
        self.updateNoteUseCase = updateNoteUseCase
        self.removeNoteUseCase = removeNoteUseCase
        self.removeAllNotesUseCase = removeAllNotesUseCase
        
        fetchAllNotes()
    }

    func createNote(title: String, text: String)  {
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
    
    func updateNote(id: UUID, newTitle: String, newText: String) {
        do {
            try updateNoteUseCase.updateNote(id: id, title: newTitle, text: newText)
            fetchAllNotes()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func removeNote(id: UUID) {
        do {
            try removeNoteUseCase.removeNote(id: id)
            fetchAllNotes()
            
        } catch {
            print(error.localizedDescription)
            
        }
    }
    
    func removeAllNotes() {
        do {
            try removeAllNotesUseCase.removeAllNotes()
            fetchAllNotes()
        } catch {
            print(error.localizedDescription)
            
        }
    }
}

