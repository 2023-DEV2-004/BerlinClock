//
//  CurrentCalendarFactoryTests.swift
//  BerlinClockTests
//

import Foundation
import XCTest
@testable import BerlinClock

class CurrentCalendarFactoryTests: XCTestCase {
    
    func testCreate() {
        XCTAssertEqual(Calendar.current, CurrentCalendarFactory().create())
    }
}
