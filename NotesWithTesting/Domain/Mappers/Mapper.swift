//
//  Mapper.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 17/3/24.
//

import Foundation

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
