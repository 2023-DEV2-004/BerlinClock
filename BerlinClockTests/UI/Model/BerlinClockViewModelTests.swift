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
        sut1.subscribeToChanges()
        XCTAssertEqual(Color.yellow, sut1.secondHighlightColor)
        
        let sut2 = try self.makeSUT(hour: 18, minute: 36, second: 1)
        sut2.subscribeToChanges()
        XCTAssertEqual(Color.clear, sut2.secondHighlightColor)
    }
    
    func testFiveHourBlocks() throws {
        let sut = try self.makeSUT(hour: 18, minute: 36, second: 0)
        sut.subscribeToChanges()

        XCTAssertEqual(
            [.init(id: "fiveHourBlock-0", active: true, color: .red),
             .init(id: "fiveHourBlock-1", active: true, color: .red),
             .init(id: "fiveHourBlock-2", active: true, color: .red),
             .init(id: "fiveHourBlock-3", active: false, color: .red)],
            sut.fiveHourBlocks
        )
    }
    
    func testOneHourBlocks() throws {
        let sut = try self.makeSUT(hour: 18, minute: 36, second: 0)
        sut.subscribeToChanges()

        XCTAssertEqual(
            [.init(id: "oneHourBlock-0", active: true, color: .red),
             .init(id: "oneHourBlock-1", active: true, color: .red),
             .init(id: "oneHourBlock-2", active: true, color: .red),
             .init(id: "oneHourBlock-3", active: false, color: .red)],
            sut.oneHourBlocks
        )
    }
    
    func testFiveMinuteBlocks() throws {
        let sut = try self.makeSUT(hour: 18, minute: 36, second: 0)
        sut.subscribeToChanges()

        XCTAssertEqual(
            [.init(id: "fiveMinuteBlock-0", active: true, color: .yellow),
             .init(id: "fiveMinuteBlock-1", active: true, color: .yellow),
             .init(id: "fiveMinuteBlock-2", active: true, color: .red),
             .init(id: "fiveMinuteBlock-3", active: true, color: .yellow),
             .init(id: "fiveMinuteBlock-4", active: true, color: .yellow),
             .init(id: "fiveMinuteBlock-5", active: true, color: .red),
             .init(id: "fiveMinuteBlock-6", active: true, color: .yellow),
             .init(id: "fiveMinuteBlock-7", active: false, color: .yellow),
             .init(id: "fiveMinuteBlock-8", active: false, color: .red),
             .init(id: "fiveMinuteBlock-9", active: false, color: .yellow),
             .init(id: "fiveMinuteBlock-10", active: false, color: .yellow)],
            sut.fiveMinuteBlocks
        )
    }
    
    func testOneMinuteBlocks() throws {
        let sut = try self.makeSUT(hour: 18, minute: 36, second: 0)

        XCTAssertEqual(
            [.init(id: "oneMinuteBlock-0", active: true, color: .red),
             .init(id: "oneMinuteBlock-1", active: false, color: .red),
             .init(id: "oneMinuteBlock-2", active: false, color: .red),
             .init(id: "oneMinuteBlock-3", active: false, color: .red)],
            sut.oneMinuteBlocks
        )
    }
    
    func testTimeDescription() throws {
        let sut = try self.makeSUT(hour: 18, minute: 36, second: 0)
        
        XCTAssertEqual("18:36", sut.timeDescription)
    }
    
    private func makeSUT(hour: Int, minute: Int, second: Int) throws -> BerlinClockViewModel {
        let calendar = Calendar(identifier: .gregorian)
        let components = DateComponents(calendar: calendar, hour: hour, minute: minute, second: second)
        let date = try XCTUnwrap(components.date)
        let berlinClock = BerlinClock(date: date, calendar: calendar)
        
        let calendarFactory = PreviewCalendarFactory(calendar: calendar)
        let datePublisherFactory = PreviewDatePublisherFactory(date: date)

        return BerlinClockViewModel(calendarFactory: calendarFactory,
                                    datePublisherFactory: datePublisherFactory,
                                    berlinClock: berlinClock,
                                    date: date)
    }
}
