//
//  BerlinClockUITests.swift
//  BerlinClockUITests
//

import XCTest

final class BerlinClockUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testBerlinClockViewIsRunning() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.otherElements["secondHighlightIdentifier"].exists)
        XCTAssertTrue(app.otherElements["fiveHourBlockSectionIdentifier"].exists)
        XCTAssertTrue(app.otherElements["oneHourBlockSectionIdentifier"].exists)
        XCTAssertTrue(app.otherElements["fiveMinuteBlockSectionIdentifier"].exists)
        XCTAssertTrue(app.otherElements["oneMinuteBlockSectionIdentifier"].exists)
        XCTAssertTrue(app.staticTexts["timeDescriptionIdentifier"].exists)
    }

}
