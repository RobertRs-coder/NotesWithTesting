//
//  NotesDatabase.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 13/3/24.
//

import Foundation
import SwiftData

enum DatabaseError: Error {
    case insertError(error: String)
    case fetchError(error: String)
    case updateError(error: String)
    case removeErrorçccc (error: String)
}

protocol NotesDatabaseProtocol {
    func insert(note: NoteDAO) async throws
    func fetchAll() async throws -> [NoteDAO]
}

@MainActor
class NotesDatabase: NotesDatabaseProtocol {
    static let shared: NotesDatabase = NotesDatabase()
    
    var container: ModelContainer = setupContainer(inMemory: false)
    
    private init() { }
    
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
    
    func insert(note: NoteDAO) throws {
        container.mainContext.insert(note)
        
        do {
            try container.mainContext.save()
        } catch {
            throw DatabaseError.insertError(error: "Error: \(error.localizedDescription)")
        }
       
    }
    
    func fetchAll() throws -> [NoteDAO] {
        let fetchDescriptor = FetchDescriptor<NoteDAO>(sortBy: [SortDescriptor<NoteDAO>(\.createdAt)])
        
        do {
            return try container.mainContext.fetch(fetchDescriptor)
        } catch {
            throw DatabaseError.fetchError(error: error.localizedDescription)
        }
    }
}
