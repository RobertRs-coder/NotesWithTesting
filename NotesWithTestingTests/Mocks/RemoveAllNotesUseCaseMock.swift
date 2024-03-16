//
//  RemoveAllNotesUseCaseMock.swift
//  NotesWithTestingTests
//
//  Created by Roberto Rojo Sahuquillo on 16/3/24.
//

import Foundation
@testable import NotesWithTesting

struct RemoveAllNotesUseCaseMock: RemoveAllNotesProtocol {
    
    func removeAllNotes() throws {
        
        mockDatabase.removeAll()
   
    }
}

