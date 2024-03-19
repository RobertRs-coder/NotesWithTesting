//
//  MainViewSnapshotTests.swift
//  NotesWithTestingTests
//
//  Created by Roberto Rojo Sahuquillo on 18/3/24.
//

import XCTest
import SnapshotTesting
@testable import NotesWithTesting

final class MainViewSnapshotTests: XCTestCase {

    func test_MainView_emptyInit_shouldBeSuccessful() throws {
        // Given
        let mainView = MainView(showCreateNote: false)
        
        // When
        
        //Then
        assertSnapshot(of: mainView, as: .image)
    }

}
