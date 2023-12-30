//
//  BerlinClock.swift
//  BerlinClock
//

import Foundation

struct BerlinClock {
    let secondHighlighted: Bool
    let fiveHourBlocks: [Bool]
    let oneHourBlocks: [Bool]
    let fiveMinuteBlocks: [Bool]
    let oneMinuteBlocks: [Bool]
    
    init(date: Date, calendar: Calendar) {
        secondHighlighted = calendar.component(.second, from: date) % 2 == 0
        fiveHourBlocks = BlockUnit.fiveHour.blockRepresentation(date: date, calendar: calendar)
        oneHourBlocks = BlockUnit.oneHour.blockRepresentation(date: date, calendar: calendar)
        fiveMinuteBlocks = BlockUnit.fiveMinute.blockRepresentation(date: date, calendar: calendar)
        oneMinuteBlocks = BlockUnit.oneMinute.blockRepresentation(date: date, calendar: calendar)
    }
}
