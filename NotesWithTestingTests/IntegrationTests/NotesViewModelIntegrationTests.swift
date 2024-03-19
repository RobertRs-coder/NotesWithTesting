//
//  NotesViewModelIntegrationTests.swift
//  NotesWithTestingTests
//
//  Created by Roberto Rojo Sahuquillo on 13/3/24.
//

import XCTest
@testable import NotesWithTesting
// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct or class]_[variable or function]_[expected result]
// Testing structure: Given, When, Then || Arrange, Act, Assert

//@MainActor
final class NotesViewModelIntegrationTests: XCTestCase {
    var sut: NotesViewModel!
    
    @MainActor
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let database = NotesDatabase.shared
        database.container = NotesDatabase.setupContainer(inMemory: true)
        
        
        let createNoteUseCase = CreateNoteUseCase(notesDatabase: database)
        let fetchAllNotesUseCase = FetchAllNotesUseCase(notesDatabase: database)
        let updateNoteUseCase = UpdateNoteUseCase(notesDatabase: database)
        let removeNoteUseCase = RemoveNoteUseCase(notesDatabase: database)
        let removeAllNotesUseCase = RemoveAllNotesUseCase(notesDatabase: database)
        
        sut = NotesViewModel(
            createNoteUseCase: createNoteUseCase,
            fetchAllNotesUseCase: fetchAllNotesUseCase,
            updateNoteUseCase: updateNoteUseCase,
            removeNoteUseCase: removeNoteUseCase,
            removeAllNotesUseCase: removeAllNotesUseCase
        )
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }
    
    @MainActor
    func test_NotesViewModel_createNote_ShoulReturnSuccess() {
        // Given
        sut.createNote(title: "Title note 1", text: "Text note 1")
        
        // When
        let note = sut.notes.first
        
        // Then
        XCTAssertEqual(note?.title, "Title note 1")
        XCTAssertEqual(note?.getText, "Text note 1")
        XCTAssertEqual(sut.notes.count, 1)
        
    }
    @MainActor
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
    
    
//    func test_NotesViewModel_createNote_shouldThrowError() {
//       // Given
//        
//        // When
//        sut.createNote(title: nil, text: "")
//        
//        // Then
//        XCTAssertEqual(sut.notes.count, 0)
//        XCTAssertNotNil(sut.databaseError)
//        XCTAssertEqual(sut.databaseError, DatabaseError.insertError)
    
    @MainActor
    func test_NotesViewModel_updateNote_ShoulReturnSuccess() {
        
        // Given
        let title = "Test title"
        let text = "Test text"
        
        sut?.createNote(title: title, text: text)
        
        // When
        let titleUpdated = "Test title updated"
        let textUpdated = "Test text updated"
        
        guard let id = sut?.notes.first?.id else {
            XCTFail("No note be created")
            return
        }
        sut?.updateNote(id: id, newTitle: titleUpdated, newText: textUpdated)
        
        // Then
        XCTAssertEqual(sut.notes.first?.title, titleUpdated)
        XCTAssertEqual(sut.notes.first?.getText, textUpdated)
    }
    
    func test_NotesViewModel_updateNote_shouldThrowError() {
        // Given

        // When
        sut.updateNote(id: UUID(), newTitle: "", newText: "")
        
        // Then
        XCTAssertEqual(sut.notes.count, 0)
        XCTAssertNotNil(sut.databaseError)
        XCTAssertEqual(sut.databaseError, DatabaseError.updateError)
    }
    
    @MainActor
    func test_NotesViewModel_removeNote_shouldRemoveNote() {
        // Given
        let title = "Test title"
        let text = "Test text"
        
        sut?.createNote(title: title, text: text)
        
        // When
        guard let id = sut.notes.first?.id else {
            XCTFail("No note be created")
            return
        }
        sut.removeNote(id: id)
        
        // Then
        XCTAssertTrue(sut.notes.count == 0)
    }
    
    @MainActor
    func test_NotesViewModel_removeNote_shouldThrowError() {
       // Given
        
        // When
        sut.removeNote(id: UUID())
        
        // Then
        XCTAssertEqual(sut.notes.count, 0)
        XCTAssertNotNil(sut.databaseError)
        XCTAssertEqual(sut.databaseError, DatabaseError.removeError)
    }
    
    @MainActor
    func test_NotesViewModel_removeAllNotes_shouldRemoveAllNotes() {
        // Given
        let title1 = "Test title 1"
        let text1 = "Test text 1"
        let title2 = "Test title 2"
        let text2 = "Test text 2"
        let title3 = "Test title 3"
        let text3 = "Test text 3"
        
        sut?.createNote(title: title1, text: text1)
        sut?.createNote(title: title2, text: text2)
        sut?.createNote(title: title3, text: text3)
        
        // When
        sut.removeAllNotes()
        
        // Then
        XCTAssertTrue(sut.notes.count == 0)
    }
}
