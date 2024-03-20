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
    
    func test_CreateNoteView_createNote_shouldCreateNote() throws {
        
        let app = XCUIApplication()
        app.launch()

        let toolBar = app.toolbars["Toolbar"]
        let createNoteViewButton = toolBar.buttons.matching(identifier: "CreateNoteViewButton").element
        createNoteViewButton.tap()
        
        let collectionViewsQuery = app.collectionViews
        
        let createNoteTitleTexfield = collectionViewsQuery.textViews.matching(identifier: "CreateNoteTitleTextField").element
        createNoteTitleTexfield.tap()
        createNoteTitleTexfield.typeText("Note 1 title")
        
        let createNoteTextTexfield = collectionViewsQuery.textViews.matching(identifier: "CreateNoteTextTextField").element
        createNoteTextTexfield.tap()
        createNoteTextTexfield.typeText("Note 1 text")
        
        
        let navBar = app.navigationBars["New Note"]
        XCTAssert(navBar.exists)
        
        let createNoteButton = navBar.buttons["CreateNoteButton"]
        
        createNoteButton.tap()
    }
    
    func test_CreateNoteView_removeNote_shouldRemoveNote() throws {
        
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
    
    func test_CreateNoteView_updateNote_shouldUpdateNote() throws {
        
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
        
        let titleTextViewUpdated = collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
            titleTextViewUpdated.tap(withNumberOfTaps: 3, numberOfTouches: 1)
            titleTextViewUpdated.typeText("Note 1 title updated")
        
        let textTextViewUpdated = collectionViewsQuery.children(matching: .cell).element(boundBy: 1).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .other).element.children(matching: .textView).element
        textTextViewUpdated.tap(withNumberOfTaps: 3, numberOfTouches: 1)
        textTextViewUpdated.typeText("Note 1 text updated")
        
        
        let navBarModifyNote = app.navigationBars["Modify Note"]
        let updateNoteButton = navBarModifyNote.buttons["UpdateNoteButton"]
        updateNoteButton.tap()
    }
}
