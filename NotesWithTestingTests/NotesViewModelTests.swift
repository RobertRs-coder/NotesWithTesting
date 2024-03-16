//
//  NotesViewModelTests.swift
//  NotesWithTestingTests
//
//  Created by Roberto Rojo Sahuquillo on 11/3/24.
//

import XCTest
@testable import NotesWithTesting
// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct or class]_[variable or function]_[expected result]
// Testing structure: Given, When, Then || Arrange, Act, Assert

final class NotesViewModelTests: XCTestCase {
    var viewModel: NotesViewModel!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel = NotesViewModel(createNoteUseCase: CreateNoteUseCaseMock(), fetchAllNotesUseCase: FetchAllNotesUseCaseMock())
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewModel = nil
        mockDatabase = []
    }

    func test_NotesViewModel_createNote_shouldAddOneNote()  {
        // Given
        let title = "Test title"
        let text = "Test text"
        
        // When
        viewModel?.createNote(title: title, text: text)
        
        // Then
        XCTAssertTrue(viewModel.notes.count == 1)
        XCTAssertEqual(viewModel.notes.first?.title, title)
        XCTAssertEqual(viewModel.notes.first?.getText, text)
    }
    
    func test_NotesViewModel_createNote_shouldAddThreeNotes() async {
        // Given
        let title1 = "Test title 1"
        let text1 = "Test text 1"
        let title2 = "Test title 2"
        let text2 = "Test text 2"
        let title3 = "Test title 3"
        let text3 = "Test text 3"
        
        // When
         viewModel?.createNote(title: title1, text: text1)
         viewModel?.createNote(title: title2, text: text2)
         viewModel?.createNote(title: title3, text: text3)

        // Then
        XCTAssertTrue(viewModel.notes.count == 3)
        XCTAssertEqual(viewModel.notes[0].title, title1)
        XCTAssertEqual(viewModel.notes[0].getText, text1)
        XCTAssertEqual(viewModel.notes[1].title, title2)
        XCTAssertEqual(viewModel.notes[1].getText, text2)
        XCTAssertEqual(viewModel.notes[2].title, title3)
        XCTAssertEqual(viewModel.notes[2].getText, text3)
    }
    
//    func test_NotesViewModel_updateNote_shouldUpdateNote() async {
//        // Given
//        let title = "Test title"
//        let text = "Test text"
//        
//         viewModel?.createNote(title: title, text: text)
//        
//        // When
//        let titleUpdated = "Test title updated"
//        let textUpdated = "Test text updated"
//        
//        guard let id = viewModel?.notes.first?.id else { 
//            XCTFail("No note be created")
//            return
//        }
//        viewModel?.updateNote(id: id, newTitle: titleUpdated, newText: textUpdated)
//        
//        // Then
//        XCTAssertEqual(viewModel.notes.first?.title, titleUpdated)
//        XCTAssertEqual(viewModel.notes.first?.getText, textUpdated)
//    }
//    
//    func test_NotesViewModel_removeNote_shouldRemoveNote() async {
//        // Given
//        let title = "Test title"
//        let text = "Test text"
//        
//        viewModel?.createNote(title: title, text: text)
//        
//        // When
//        guard let id = viewModel.notes.first?.id else {
//            XCTFail("No note be created")
//            return
//        }
//        viewModel.removeNote(id: id)
//        
//        // Then
//        XCTAssertTrue(viewModel.notes.count == 0)
//    }
}
