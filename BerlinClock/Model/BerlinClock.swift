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
    
    init(date: Date) {
        fiveHourBlocks = Array(repeating: false, count: 4)
        oneHourBlocks = Array(repeating: false, count: 4)
        fiveMinuteBlocks = Array(repeating: false, count: 11)
        oneMinuteBlocks = Array(repeating: false, count: 4)
    }
}
