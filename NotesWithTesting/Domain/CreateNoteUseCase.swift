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


/*
 Implement mappers
 -----------------
 protocol CharacterModelToCollectionCellModelMapperProtocol {
     func map(_ characters: CharactersModel?) -> [CollectionCellModel]
     func map(_ character: CharacterModel?) -> CollectionCellModel?
 }

 class CharacterModelToCollectionCellModelMapper: CharacterModelToCollectionCellModelMapperProtocol {
     func map(_ characters: CharactersModel?) -> [CollectionCellModel] {
         guard let characters = characters else { return [] }
         return characters.compactMap { map($0)
         }
     }
     
     func map(_ character: CharacterModel?) -> CollectionCellModel? {
         guard let character = character else { return nil }
         return CollectionCellModel(image: character.image,
                                    title: "\(character.name) \(character.lastname)")
         }
 }
 
 */
