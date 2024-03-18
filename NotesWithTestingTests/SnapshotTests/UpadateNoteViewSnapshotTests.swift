//
//  UpadateNoteViewSnapshotTests.swift
//  NotesWithTestingTests
//
//  Created by Roberto Rojo Sahuquillo on 18/3/24.
//

import XCTest
import SwiftUI
import SnapshotTesting
@testable import NotesWithTesting

final class UpadateNoteViewSnapshotTests: XCTestCase {

    func test_UpdateView_emptyInit_shouldBeSuccessful() throws {
        // Given
        
        let updateNoteView = UpdateNoteView(viewModel: .init(), id: UUID())
        let vc = UIHostingController(rootView: updateNoteView)
        // When
        
        //Then
        assertSnapshot(of: vc, as: .image)
    }
    
//    func test_CreateNoteView_notEmptyInit_shouldBeSuccessful() throws {
//        // Given
//        let createNoteViewNotEmpty = CreateNoteView(viewModel: .init(), title: "Test title", text: "Test text")
//        
//        // When
//        
//        //Then
//        assertSnapshot(of: createNoteViewNotEmpty, as: .image)
//    }

}
