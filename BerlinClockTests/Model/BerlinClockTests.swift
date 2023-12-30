//
//  BerlinClockTests.swift
//  BerlinClockTests
//

import Foundation
import XCTest
@testable import BerlinClock

class BerlinClockTests: XCTestCase {
    
    func testArrayCapacity() {
        let sut = BerlinClock()
        
        XCTAssertEqual(4, sut.fiveHourBlocks.count)
        XCTAssertEqual(4, sut.oneHourBlocks.count)
        XCTAssertEqual(11, sut.fiveMinuteBlocks.count)
        XCTAssertEqual(4, sut.oneMinuteBlocks.count)
    }
    
}
