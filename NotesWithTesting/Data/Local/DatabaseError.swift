//
//  DatabaseError.swift
//  NotesWithTesting
//
//  Created by Roberto Rojo Sahuquillo on 17/3/24.
//

import Foundation

enum DatabaseError: Error {
    case insertError
    case fetchError
    case updateError
    case removeError
}
