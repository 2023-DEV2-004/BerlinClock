//
//  RealDatePublisherFactory.swift
//  BerlinClock
//

import Foundation
import Combine

struct RealDatePublisherFactory: DatePublisherFactory {
    func create() -> AnyPublisher<Date, Never> {
        Empty().eraseToAnyPublisher()
    }
}

