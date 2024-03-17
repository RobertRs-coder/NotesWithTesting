//
//  DatabaseError.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 17/3/24.
//

import Foundation

enum DatabaseError: Error {
    case insertError(error: String)
    case fetchError(error: String)
    case updateError(error: String)
    case removeError (error: String)
}
