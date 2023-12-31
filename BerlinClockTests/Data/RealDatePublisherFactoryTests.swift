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
        var dates = Set<Date>()
        
        // Act
        sut.create()
            .sink { date in
                dates.insert(date)
                currentDateExpectation.fulfill()
            }
            .store(in: &cancellables)
                
        wait(for: [currentDateExpectation], timeout: 5.0)
        
        // Assert
        XCTAssertEqual(5, dates.count)
    }

}
