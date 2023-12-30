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
    
    func testDateParsingInFiveHourBlocks() throws {
        let sut = try self.makeSUT()
        
        XCTAssertEqual([true, true, true, false], sut.fiveHourBlocks)
    }
    
    func testDateParsingOneHourBlocks() throws {
        let sut = try self.makeSUT()
        
        XCTAssertEqual([true, true, true, false], sut.oneHourBlocks)
    }
    
    func testDateParsingFiveMinuteBlocks() throws {
        let sut = try self.makeSUT()
        
        XCTAssertEqual([true, true, true, true, true, true, true, false, false, false, false], sut.fiveMinuteBlocks)
    }
    
    func testDateParsingOneMinuteBlocks() throws {
        let sut = try self.makeSUT()
        
        XCTAssertEqual([true, false, false, false], sut.oneMinuteBlocks)
    }
    
    private func makeSUT() throws -> BerlinClock {
        let calendar: Calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(calendar: calendar, hour: 18, minute: 36, second: 0)
        let date = try XCTUnwrap(components.date)
        
        return BerlinClock(date: date, calendar: calendar)
    }
    
}
