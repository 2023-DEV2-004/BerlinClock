//
//  Factory.swift
//  BerlinClock
//

import Foundation

/// The blueprint for a factory to create `FactoryItem`'s.
protocol Factory {

    associatedtype FactoryItem
    
    /// Creates a `FactoryItem`
    /// - Returns: a `FactoryItem`
    func create() -> FactoryItem
}
