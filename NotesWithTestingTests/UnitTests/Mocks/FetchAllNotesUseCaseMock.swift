//
//  FetchAllNotesUseCaseMock.swift
//  NotesWithTestingTests
//
//  Created by Roberto Rojo Sahuquillo on 14/3/24.
//

import Foundation
@testable import NotesWithTesting

struct FetchAllNotesUseCaseMock: FetchAllNotesProtocol {
    
    func fetchAll() throws -> [Note] {
        return mockDatabase
    }
}
