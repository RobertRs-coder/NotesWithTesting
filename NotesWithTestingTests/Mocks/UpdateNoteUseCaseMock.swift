//
//  UpdateNoteUSeCaseMock.swift
//  NotesWithTestingTests
//
//  Created by Roberto Rojo Sahuquillo on 16/3/24.
//

import Foundation
@testable import NotesWithTesting

struct UpdateNoteUseCaseMock: UpdateNoteProtocol {

    func updateNote(id: UUID, title: String, text: String) throws {
        
        if let index = mockDatabase.firstIndex(where: { $0.id == id }) {
            let updatedNote = Note(id: id, title: title, text: text, createdAt: mockDatabase[index].createdAt)
            mockDatabase[index] = updatedNote
        }
    }
}
