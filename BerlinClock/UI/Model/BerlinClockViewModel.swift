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
    
    init(berlinClock: BerlinClock) {
        self.berlinClock = berlinClock
        self.secondHighlightColor = berlinClock.secondHighlighted ? .yellow : .clear
        self.fiveHourBlocks = berlinClock.fiveHourBlocks.map({ Block(active: $0, color: .red) })
        self.oneHourBlocks = berlinClock.oneHourBlocks.map({ Block(active: $0, color: .red) })
    }
}
