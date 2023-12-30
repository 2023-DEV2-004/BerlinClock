//
//  BerlinClock.swift
//  BerlinClock
//

import Foundation

struct BerlinClock {
    let fiveHourBlocks: [Bool]
    let oneHourBlocks: [Bool]
    let fiveMinuteBlocks: [Bool]
    let oneMinuteBlocks: [Bool]
    
    init(date: Date, calendar: Calendar) {
        let componentValue = calendar.component(.hour, from: date)
        let numberOfActiveBlocks = componentValue / 5
        let fiveHourBlockArrayCapacity = 4
        let numberOfInactiveBlocks = fiveHourBlockArrayCapacity - numberOfActiveBlocks
        let activeBlocks = (0..<numberOfActiveBlocks).map { _ in true }
        let inactiveBlocks = (0..<numberOfInactiveBlocks).map { _ in false }
        
        fiveHourBlocks = activeBlocks + inactiveBlocks

        oneHourBlocks = Array(repeating: false, count: 4)
        fiveMinuteBlocks = Array(repeating: false, count: 11)
        oneMinuteBlocks = Array(repeating: false, count: 4)
    }
}
