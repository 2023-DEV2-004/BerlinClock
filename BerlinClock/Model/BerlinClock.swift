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
        let hourComponentValue = calendar.component(.hour, from: date)
        let minuteComponentValue = calendar.component(.minute, from: date)

        let numberOfFiveHourActiveBlocks = hourComponentValue / 5
        let fiveHourBlockArrayCapacity = 4
        let numberOfFiveHourInactiveBlocks = fiveHourBlockArrayCapacity - numberOfFiveHourActiveBlocks
        let activeFiveHourBlocks = (0..<numberOfFiveHourActiveBlocks).map { _ in true }
        let inactiveFiveHourBlocks = (0..<numberOfFiveHourInactiveBlocks).map { _ in false }
        
        fiveHourBlocks = activeFiveHourBlocks + inactiveFiveHourBlocks
        
        let numberOfOneHourActiveBlocks = hourComponentValue % 5
        let oneHourBlockArrayCapacity = 4
        let numberOfOneHourInactiveBlocks = oneHourBlockArrayCapacity - numberOfOneHourActiveBlocks
        let activeOneHourBlocks = (0..<numberOfOneHourActiveBlocks).map { _ in true }
        let inactiveOneHourBlocks = (0..<numberOfOneHourInactiveBlocks).map { _ in false }

        oneHourBlocks = activeOneHourBlocks + inactiveOneHourBlocks

        let numberOfFiveMinuteActiveBlocks = minuteComponentValue / 5
        let fiveMinuteBlockArrayCapacity = 11
        let numberOfFiveMinuteInactiveBlocks = fiveMinuteBlockArrayCapacity - numberOfFiveMinuteActiveBlocks
        let activeFiveMinuteBlocks = (0..<numberOfFiveMinuteActiveBlocks).map { _ in true }
        let inactiveFiveMinuteBlocks = (0..<numberOfFiveMinuteInactiveBlocks).map { _ in false }

        fiveMinuteBlocks = activeFiveMinuteBlocks + inactiveFiveMinuteBlocks

        oneMinuteBlocks = Array(repeating: false, count: 4)
    }
}
