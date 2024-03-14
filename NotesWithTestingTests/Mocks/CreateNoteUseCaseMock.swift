//
// CreateNoteUseCaseMock.swift
//  NotesWithTestingTests
//
//  Created by Roberto Rojo Sahuquillo on 14/3/24.
//

import Foundation
@testable import NotesWithTesting

var mockDatabase: [Note] = []

struct CreateNoteUseCaseMock: CreateNoteProtocol {

    func createNote(title: String, text: String) throws {
        let note: Note = .init(id: .init(),title: title, text: text, createdAt: .now)
        
        mockDatabase.append(note)
        
    }
}
