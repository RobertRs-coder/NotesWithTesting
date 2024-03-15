//
//  NotesDatabase.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 13/3/24.
//

import Foundation
import SwiftData

enum DatabaseError: Error, LocalizedError{
    case insertError(error: String)
    case fetchError(error: String)
    case updateError(error: String)
    case removeError (error: String)
}

protocol NotesDatabaseProtocol {
    func insert(note: NoteDAO) throws
    func fetchAll() throws -> [NoteDAO]
    func update(note: NoteDAO) throws
    func remove(note: NoteDAO) throws
}

class NotesDatabase: NotesDatabaseProtocol {
    static let shared: NotesDatabase = NotesDatabase()
    
    @MainActor
    var container: ModelContainer = setupContainer(inMemory: false)
    
    private init() { }
    
    @MainActor
    static func setupContainer(inMemory: Bool) -> ModelContainer {
        do {
            let container = try ModelContainer(
                for: NoteDAO.self,
                configurations: ModelConfiguration(isStoredInMemoryOnly: inMemory)
            )
            container.mainContext.autosaveEnabled = true
            return container
        } catch {
            print("Error \(error.localizedDescription)")
            fatalError("Database can't be created")
        }
    }
    @MainActor 
    func insert(note: NoteDAO) throws {
        container.mainContext.insert(note)
        
        do {
            try container.mainContext.save()
        } catch {
            throw DatabaseError.insertError(error: "Error: \(error.localizedDescription)")
        }
       
    }
    @MainActor 
    func fetchAll() throws -> [NoteDAO] {
        let fetchDescriptor = FetchDescriptor<NoteDAO>(sortBy: [SortDescriptor<NoteDAO>(\.createdAt)])
        
        do {
            return try container.mainContext.fetch(fetchDescriptor)
        } catch {
            throw DatabaseError.fetchError(error: error.localizedDescription)
        }
    }
    
    @MainActor
    func update(note: NoteDAO) throws  {
        let notePredicate = #Predicate<NoteDAO>{
            $0.identifier == note.identifier
        }
        
        var fetchDescriptor = FetchDescriptor<NoteDAO>(predicate: notePredicate)
        fetchDescriptor.fetchLimit = 1
        
        do {
            guard let updatedNote = try container.mainContext.fetch(fetchDescriptor).first else {
                
                throw DatabaseError.updateError(error: "Error")
            }

            updatedNote.title = note.title
            updatedNote.text = note.text
            
            try container.mainContext.save()
        } catch {
            throw DatabaseError.updateError(error: error.localizedDescription)
        }
    }
    
    @MainActor
    func remove(note: NoteDAO) throws  {
        let notePredicate = #Predicate<NoteDAO>{
            $0.identifier == note.identifier
        }
        
        var fetchDescriptor = FetchDescriptor<NoteDAO>(predicate: notePredicate)
        fetchDescriptor.fetchLimit = 1
        
        do {
            guard let deletedNote = try container.mainContext.fetch(fetchDescriptor).first else {
                
                throw DatabaseError.removeError(error: "Error")
            }

            container.mainContext.delete(deletedNote)
            try container.mainContext.save()
        } catch {
            throw DatabaseError.removeError(error: error.localizedDescription)
        }
    }

    
    @MainActor
    func removeAll() throws  {
        do {
            try container.mainContext.delete(model: NoteDAO.self)
        } catch {
            throw DatabaseError.removeError(error: error.localizedDescription)
        }
    }
}
