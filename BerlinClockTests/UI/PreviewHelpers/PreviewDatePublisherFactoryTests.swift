//
//  PreviewDatePublisherFactoryTests.swift
//  BerlinClockTests
//

import Foundation
import Combine
import XCTest
@testable import BerlinClock

class PreviewDatePublisherFactoryTests: XCTestCase {
    
    private var cancellables = Set<AnyCancellable>()
    
    override func tearDown() {
        super.tearDown()
        cancellables.removeAll()
    }
    
    func testCreate() {
        let date = Date()
        let sut = PreviewDatePublisherFactory(date: date)
        let receiveDateExpectation = XCTestExpectation(description: "Receive date from publisher")
        
        sut.create()
            .sink { receivedDate in
                XCTAssertEqual(receivedDate, date)
                receiveDateExpectation.fulfill()
            }
            .store(in: &cancellables)
        
        wait(for: [receiveDateExpectation], timeout: 1.0)
    }

}
