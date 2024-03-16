//
//  RemoveNoteUseCaseMock.swift
//  NotesWithTestingTests
//
//  Created by Roberto Rojo Sahuquillo on 16/3/24.
//

import Foundation
@testable import NotesWithTesting

struct RemoveNoteUseCaseMock: RemoveNoteProtocol {
    
    func removeNote(id: UUID) throws {
        
        mockDatabase.removeAll(where: { $0.id == id })
   
    }
}
