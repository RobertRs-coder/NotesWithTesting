//
//  NotesViewModelIntegrationTests.swift
//  NotesWithTestingTests
//
//  Created by Roberto Rojo Sahuquillo on 13/3/24.
//

import XCTest
@testable import NotesWithTesting

@MainActor
final class NotesViewModelIntegrationTests: XCTestCase {
    var sut: NotesViewModel!
     
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let database = NotesDatabase.shared
            database.container = NotesDatabase.setupContainer(inMemory: true)
     

        let createNoteUseCase = CreateNoteUseCase(notesDatabase: database)
        let fetchAllNotesUseCase = FetchAllNotesUseCase(notesDatabase: database)
        
        sut = NotesViewModel(createNoteUseCase: createNoteUseCase, fetchAllNotesUSeCase: fetchAllNotesUseCase)
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_NotesViewModel_createOneNote_ShoulReturnSuccess() {
        // Given
        sut.createNote(title: "Title note 1", text: "Text note 1")

        // When
        let note = sut.notes.first

        // Then
        XCTAssertEqual(note?.title, "Title note 1")
        XCTAssertEqual(note?.getText, "Text note 1")
        XCTAssertEqual(sut.notes.count, 1)

    }
    
    func test_NotesViewModel_createTwoNote_ShoulReturnSuccess() {
        // Given
        sut.createNote(title: "Title note 1", text: "Text note 1")
        sut.createNote(title: "Title note 2", text: "Text note 2")

        // When
        let firstNote = sut.notes.first
        let lastNote = sut.notes.last

        // Then
        XCTAssertEqual(sut.notes.count, 2)
        XCTAssertEqual(firstNote?.title, "Title note 1")
        XCTAssertEqual(firstNote?.getText, "Text note 1")
        XCTAssertEqual(lastNote?.title, "Title note 2")
        XCTAssertEqual(lastNote?.getText, "Text note 2")
    }
}
