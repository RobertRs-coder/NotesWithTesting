//
//  NotesDatabaseProtocol.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 17/3/24.
//

import Foundation

protocol NotesDatabaseProtocol {
    func insert(note: NoteDAO) throws
    func fetchAll() throws -> [NoteDAO]
    func update(identifier: UUID, title: String, text: String) throws
    func remove(identifier: UUID) throws
    func removeAll() throws
}
