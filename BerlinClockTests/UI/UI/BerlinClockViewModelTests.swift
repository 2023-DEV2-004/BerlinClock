//
//  BerlinClockViewModelTests.swift
//  BerlinClockTests
//

import Foundation
import XCTest
import SwiftUI
@testable import BerlinClock

class BerlinClockViewModelTests: XCTestCase {
    
    func testSecondHighlightColor() throws {
        let sut1 = try self.makeSUT(hour: 18, minute: 36, second: 0)
        XCTAssertEqual(Color.yellow, sut1.secondHighlightColor)
        
        let sut2 = try self.makeSUT(hour: 18, minute: 36, second: 1)
        XCTAssertEqual(Color.clear, sut2.secondHighlightColor)
    }
    
    private func makeSUT(hour: Int, minute: Int, second: Int) throws -> BerlinClockViewModel {
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(calendar: calendar, hour: hour, minute: minute, second: second)
        let date = try XCTUnwrap(components.date)
        let berlinClock = BerlinClock(date: date, calendar: calendar)

        return BerlinClockViewModel(berlinClock: berlinClock)
    }
}