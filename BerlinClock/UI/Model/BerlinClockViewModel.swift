//
//  BerlinClockViewModel.swift
//  BerlinClock
//

import Foundation
import SwiftUI

class BerlinClockViewModel {
    
    private let berlinClock: BerlinClock

    var secondHighlightColor: Color = .clear
    var fiveHourBlocks: [Block] = []
    var oneHourBlocks: [Block] = []
    var fiveMinuteBlocks: [Block] = []
    var oneMinuteBlocks: [Block] = []
    
    init(berlinClock: BerlinClock) {
        self.berlinClock = berlinClock
        self.secondHighlightColor = berlinClock.secondHighlighted ? .yellow : .clear
        self.fiveHourBlocks = berlinClock.fiveHourBlocks.map({ Block(active: $0, color: .red) })
        self.oneHourBlocks = berlinClock.oneHourBlocks.map({ Block(active: $0, color: .red) })
        self.fiveMinuteBlocks = berlinClock.fiveMinuteBlocks.enumerated()
            .map({ (index, active) in
                let incrementedIndex = index + 1 // .enumerated indexes are zerobased.
                let color: Color = (incrementedIndex % 3 == 0) ? .red : .yellow

                return Block(active: active, color: color)
            })
    }
}
