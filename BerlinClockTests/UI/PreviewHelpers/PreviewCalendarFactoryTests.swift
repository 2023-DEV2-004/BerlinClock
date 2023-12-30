//
//  PreviewCalendarFactoryTests.swift
//  BerlinClockTests
//

import Foundation
import XCTest
@testable import BerlinClock

class PreviewCalendarFactoryTests: XCTestCase {
    
    func testCreate() {
        let calendar = Calendar(identifier: .gregorian)
        let sut = PreviewCalendarFactory(calendar: calendar)
        
        let createdCalendar = sut.create()
        
        XCTAssertEqual(calendar, createdCalendar)
    }

}
