//
//  RealDatePublisherFactory.swift
//  BerlinClock
//

import Foundation
import Combine

struct RealDatePublisherFactory: DatePublisherFactory {
    func create() -> AnyPublisher<Date, Never> {
        Timer.publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .eraseToAnyPublisher()
    }
}

