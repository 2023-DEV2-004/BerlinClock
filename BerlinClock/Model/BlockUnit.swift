//
//  BlockUnit.swift
//  BerlinClock
//

import Foundation

/// An definitive list of units that a `BerlinClock` can have.
enum BlockUnit {

    /// The first row of a Berlin Clock exists out of 4 five hour blocks.
    case fiveHour

    /// The second row of a Berlin Clock exists out of 4 one hour blocks.
    case oneHour

    /// The third row of a Berlin Clock exists out of 11 five minute blocks.
    case fiveMinute

    /// The first row of a Berlin Clock exists out of 4 one minute blocks.
    case oneMinute

}

extension BlockUnit {
    
    private var value: Int {
        switch self {
        case .fiveHour, .fiveMinute:
            return 5
        case .oneHour, .oneMinute:
            return 1
        }
    }
    
    private var arrayCount: Int {
        switch self {
        case .fiveHour:
            return 4
        case .oneHour:
            return 4
        case .fiveMinute:
            return 11
        case .oneMinute:
            return 4
        }
    }
    
    private var calendarComponent: Calendar.Component {
        switch self {
        case .fiveHour, .oneHour:
            return .hour
        case .fiveMinute, .oneMinute:
            return .minute
        }
    }
    
    private var procedingBlockUnit: BlockUnit? {
        switch self {
        case .fiveHour, .fiveMinute:
            return nil
        case .oneHour:
            return .fiveHour
        case .oneMinute:
            return .fiveMinute
        }
    }
    
    /// Generates a `Berlin Clock` representation for the specific `BlockUnit`
    /// - Parameters:
    ///   - date: The date object that will be represented as a `Berlin Clock`
    ///   - calendar: The calendar that serves for the correct date formatting.
    /// - Returns: An array of `Bool`'s that resemble the active and inactive blocks.
    func blockRepresentation(date: Date, calendar: Calendar) -> [Bool] {
        let componentValue = calendar.component(self.calendarComponent, from: date)
        let numberOfActiveBlocks = self.numberOfActiveBlocks(componentValue: componentValue)
        let numberOfInactiveBlocks = self.arrayCount - numberOfActiveBlocks
        let activeBlocks = (0..<numberOfActiveBlocks).map { _ in true }
        let inactiveBlocks = (0..<numberOfInactiveBlocks).map { _ in false }
        
        return activeBlocks + inactiveBlocks
    }
    
    private func numberOfActiveBlocks(componentValue: Int) -> Int {
        if let procedingBlockUnit = self.procedingBlockUnit {
            return componentValue % procedingBlockUnit.value
        } else {
            return componentValue / self.value
        }
    }
}
