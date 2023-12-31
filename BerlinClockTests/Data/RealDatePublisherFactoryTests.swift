//
//  RealDatePublisherFactoryTests.swift
//  BerlinClockTests
//

import Foundation
import Combine
import XCTest
@testable import BerlinClock

class RealDatePublisherFactoryTests: XCTestCase {
    
    private var cancellables: Set<AnyCancellable> = Set()
    
    override func tearDown() {
        cancellables.removeAll()
    }
    
    func testReceiveNewDateEverySecond() throws {
        // Arrange
        let sut = RealDatePublisherFactory()
        let currentDateExpectation = XCTestExpectation(description: "current date being published")
        currentDateExpectation.expectedFulfillmentCount = 5
        var dates = [Date]()
        
        sut.create()
            .sink { date in
                dates.append(date)
                currentDateExpectation.fulfill()
            }
            .store(in: &cancellables)
                
        wait(for: [currentDateExpectation], timeout: 5.0)
        
        let seconds = dates.map({ Calendar.current.component(.second, from: $0) })
        
        let secondsAreConsecutive = seconds
            .filter({ $0 != 0 }) // To prevent scenario's where seconds equals to [56, 57, 58, 59, 0]
            .map { $0 - 1 }
            .dropFirst() == seconds.dropLast()
        
        XCTAssertTrue(secondsAreConsecutive)
    }

}
