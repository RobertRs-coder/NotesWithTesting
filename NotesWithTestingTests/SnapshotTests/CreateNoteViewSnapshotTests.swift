//
//  SnapshotTests.swift
//  NotesWithTestingTests
//
//  Created by Roberto Rojo Sahuquillo on 18/3/24.
//

import XCTest
import SnapshotTesting
@testable import NotesWithTesting


final class CreateNoteViewSnapshotTests: XCTestCase {
    
    func test_CreateNoteView_emptyInit_shouldBeSuccessful() throws {
        // Given
        let createNoteView = CreateNoteView(viewModel: .init())
        
        // When
        
        //Then
        assertSnapshot(of: createNoteView, as: .image)
    }
    
    func test_CreateNoteView_notEmptyInit_shouldBeSuccessful() throws {
        // Given
        let createNoteViewNotEmpty = CreateNoteView(viewModel: .init(), title: "Test title", text: "Test text")
        
        // When
        
        //Then
        assertSnapshot(of: createNoteViewNotEmpty, as: .image)
    }
}
