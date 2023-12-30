//
//  DatePublisherFactory.swift
//  BerlinClock
//

import Foundation
import Combine

protocol DatePublisherFactory: Factory where FactoryItem == AnyPublisher<Date, Never> {}
