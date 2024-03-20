//
//  NotesWithTestingUITests.swift
//  NotesWithTestingUITests
//
//  Created by Roberto Rojo Sahuquillo on 19/3/24.
//

import XCTest
// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Naming Structure: test_[struct]_[ui component]_[expected result]
// Naming Structure: test_[struct]_[navigation flow]_[expected result] ¿?
// Testing structure: Given, When, Then || Arrange, Act, Assert

final class NotesWithTestingUITests: XCTestCase {
    
    func test_CreateNoteView_createNote_shouldBeSuccessfull() throws {
        // UI tests must launch the application that they test.
        
        let app = XCUIApplication()
        app.launch()

        let toolBar = app.toolbars["Toolbar"]

        let createNoteButton = toolBar.buttons["Create Note"]
        createNoteButton.tap()

        let collectionViewsQuery = app.collectionViews
        
        let titleTextView = collectionViewsQuery.textViews.matching(identifier: "CreateNoteTitleTextField").element
        titleTextView.tap()
        titleTextView.typeText("Test note 1 title")
        XCTAssert(titleTextView.exists)
        
        let textTextView = collectionViewsQuery.textViews.matching(identifier: "CreateNoteTextTextField").element
        textTextView.tap()
        textTextView.typeText("Test note 1 text")
        XCTAssert(textTextView.exists)
        
        let navBar = app.navigationBars["New Note"]
        XCTAssert(navBar.exists)
        
        navBar.buttons["Create Note"].tap()

    }
    
    func test_CreateNoteView_removeNote_shouldBeSuccessfull() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        let toolBar = app.toolbars["Toolbar"]

        let createNoteButton = toolBar.buttons["Create Note"]
        createNoteButton.tap()

        let collectionViewsQuery = app.collectionViews
        
        let titleTextView = collectionViewsQuery.textViews.matching(identifier: "CreateNoteTitleTextField").element
        titleTextView.tap()
        titleTextView.typeText("Test note 1 title")
        XCTAssert(titleTextView.exists)
        
        let textTextView = collectionViewsQuery.textViews.matching(identifier: "CreateNoteTextTextField").element
        textTextView.tap()
        textTextView.typeText("Test note 1 text")
        XCTAssert(textTextView.exists)
        
        let navBar = app.navigationBars["New Note"]
        XCTAssert(navBar.exists)
        
        navBar.buttons["Create Note"].tap()
        
        let firstNote = collectionViewsQuery.cells.element(boundBy: 0)
        firstNote.tap()
        
        let deleteNoteButton = app.buttons.matching(identifier: "DeleteNoteButton").element
        deleteNoteButton.tap()

    }
}
