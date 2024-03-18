//
//  NotesViewModel.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 9/3/24.
//

import Foundation


final class NotesViewModel: ObservableObject {
    @Published var notes: [Note]
    @Published var databaseError: DatabaseError?
    private let createNoteUseCase: CreateNoteProtocol
    private let fetchAllNotesUseCase: FetchAllNotesProtocol
    private let updateNoteUseCase: UpdateNoteProtocol
    private let removeNoteUseCase: RemoveNoteProtocol
    private let removeAllNotesUseCase: RemoveAllNotesProtocol

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
        } catch let error as DatabaseError {
            print(error.localizedDescription)
            databaseError = error
        } catch {
            print(error.localizedDescription)
            
        }
    }
    func fetchAllNotes()  {
        do {
            notes = try fetchAllNotesUseCase.fetchAll()
        } catch let error as DatabaseError {
            print(error.localizedDescription)
            databaseError = error
        } catch {
            print(error.localizedDescription)
            
        }
    }
    
    func updateNote(id: UUID, newTitle: String, newText: String) {
        do {
            try updateNoteUseCase.updateNote(id: id, title: newTitle, text: newText)
            fetchAllNotes()
        } catch let error as DatabaseError {
            print(error.localizedDescription)
            databaseError = error
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func removeNote(id: UUID) {
        do {
            try removeNoteUseCase.removeNote(id: id)
            fetchAllNotes()
            
        } catch let error as DatabaseError {
            print(error.localizedDescription)
            databaseError = error
        }catch {
            print(error.localizedDescription)
            
        }
    }
    
    func removeAllNotes() {
        do {
            try removeAllNotesUseCase.removeAllNotes()
            fetchAllNotes()
        } catch let error as DatabaseError {
            print(error.localizedDescription)
            databaseError = error
        } catch {
            print(error.localizedDescription)
            
        }
    }
}

