//
//  BerlinClockTests.swift
//  BerlinClockTests
//

import Foundation
import XCTest
@testable import BerlinClock

class BerlinClockTests: XCTestCase {
    
    func testArrayCapacity() {
        let sut = BerlinClock(date: Date(), calendar: .current)
        
        XCTAssertEqual(4, sut.fiveHourBlocks.count)
        XCTAssertEqual(4, sut.oneHourBlocks.count)
        XCTAssertEqual(11, sut.fiveMinuteBlocks.count)
        XCTAssertEqual(4, sut.oneMinuteBlocks.count)
    }
    
    func testSecondHighlighted() throws {
        let sut1 = try self.makeSUT(hour: 18, minute: 36, second: 0)
        XCTAssertTrue(sut1.secondHighlighted)
        
        let sut2 = try self.makeSUT(hour: 18, minute: 36, second: 1)
        XCTAssertFalse(sut2.secondHighlighted)
    }
    
    func testDateParsingInFiveHourBlocks() throws {
        let sut = try self.makeSUT(hour: 18, minute: 36, second: 0)
        
        XCTAssertEqual([true, true, true, false], sut.fiveHourBlocks)
    }
    
    func testDateParsingOneHourBlocks() throws {
        let sut = try self.makeSUT(hour: 18, minute: 36, second: 0)
        
        XCTAssertEqual([true, true, true, false], sut.oneHourBlocks)
    }
    
    func testDateParsingFiveMinuteBlocks() throws {
        let sut = try self.makeSUT(hour: 18, minute: 36, second: 0)
        
        XCTAssertEqual([true, true, true, true, true, true, true, false, false, false, false], sut.fiveMinuteBlocks)
    }
    
    func testDateParsingOneMinuteBlocks() throws {
        let sut = try self.makeSUT(hour: 18, minute: 36, second: 0)
        
        XCTAssertEqual([true, false, false, false], sut.oneMinuteBlocks)
    }
    
    private func makeSUT(hour: Int, minute: Int, second: Int) throws -> BerlinClock {
        let calendar: Calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(calendar: calendar, hour: hour, minute: minute, second: second)
        let date = try XCTUnwrap(components.date)
        
        return BerlinClock(date: date, calendar: calendar)
    }
    
}
