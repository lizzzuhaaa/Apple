//
//  SnapUITests.swift
//  SnapUITests
//
//  Created by лізушка лізушкіна on 20.06.2023.
//

import XCTest

final class SnapUITests: XCTestCase {
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
    }

    func testExample() throws {
        snapshot("Yelizavieta_MainScreen")
        XCUIApplication().scrollViews.otherElements.containing(.staticText, identifier:"Funny Animals").children(matching: .button).element(boundBy: 0).tap()
        snapshot("Yelizavieta_DetailsScreen")
        
    }
}
