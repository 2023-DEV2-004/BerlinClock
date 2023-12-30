//
//  PreviewDatePublisherFactory.swift
//  BerlinClock
//

import Foundation
import Combine

struct PreviewDatePublisherFactory: DatePublisherFactory {
    
    let date: Date
    
    func create() -> AnyPublisher<Date, Never> {
        Just(date).eraseToAnyPublisher()
    }
    
}
