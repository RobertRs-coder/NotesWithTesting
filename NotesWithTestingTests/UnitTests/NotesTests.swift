//
//  NotesTests.swift
//  NotesWithTestingTests
//
//  Created by Roberto Rojo Sahuquillo on 11/3/24.
//

import XCTest
@testable import NotesWithTesting
// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct or class]_[variable or function]_[expected result]
// Testing structure: Given, When, Then || Arrange, Act, Assert

final class NotesTests: XCTestCase {

    func test_Note_init_shouldBeSuccessful() {
        // Given
        let title = "Test title"
        let text = "Test text"
        let date = Date()
        
        // When
        let note = Note(title: title, text: text, createdAt: date)
        
        // Then
        XCTAssertEqual(note.title, title)
        XCTAssertEqual(note.text, text)
        XCTAssertEqual(note.createdAt, date)
        
    }
    
    func test_Note_initWithNilText_GetText_shouldReturnEmptyString() {
        // Given
        let title = "Test title"
        let date = Date()
        
        //When
        let note = Note(title: title, text: nil,  createdAt: date)
    
        // Then
        XCTAssertEqual(note.getText, "")
        
    }

}
