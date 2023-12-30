//
//  BerlinClock.swift
//  BerlinClock
//

import Foundation

/// A `Berlin Clock` representation according to a specific `Date` and the related `Calendar`.
struct BerlinClock {

    /// A bool that is true when the second value is even, false when it is uneven.
    let secondHighlighted: Bool

    /// An array of `Bool`'s that resemble whether a five hour block is active or not
    let fiveHourBlocks: [Bool]

    /// An array of `Bool`'s that resemble whether a one hour block is active or not
    let oneHourBlocks: [Bool]

    /// An array of `Bool`'s that resemble whether a five minute block is active or not
    let fiveMinuteBlocks: [Bool]

    /// An array of `Bool`'s that resemble whether a one minute block is active or not
    let oneMinuteBlocks: [Bool]

    init(date: Date, calendar: Calendar) {
        secondHighlighted = calendar.component(.second, from: date) % 2 == 0
        fiveHourBlocks = BlockUnit.fiveHour.blockRepresentation(date: date, calendar: calendar)
        oneHourBlocks = BlockUnit.oneHour.blockRepresentation(date: date, calendar: calendar)
        fiveMinuteBlocks = BlockUnit.fiveMinute.blockRepresentation(date: date, calendar: calendar)
        oneMinuteBlocks = BlockUnit.oneMinute.blockRepresentation(date: date, calendar: calendar)
    }

}
