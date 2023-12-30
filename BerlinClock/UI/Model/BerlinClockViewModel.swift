//
//  BerlinClockViewModel.swift
//  BerlinClock
//

import Foundation
import SwiftUI

class BerlinClockViewModel: ObservableObject {
    
    private let berlinClock: BerlinClock

    var secondHighlightColor: Color = .clear
    var fiveHourBlocks: [Block] = []
    var oneHourBlocks: [Block] = []
    var fiveMinuteBlocks: [Block] = []
    var oneMinuteBlocks: [Block] = []
    var timeDescription: String = ""
    
    init(berlinClock: BerlinClock, date: Date) {
        self.berlinClock = berlinClock
        self.secondHighlightColor = berlinClock.secondHighlighted ? .yellow : .clear
        self.fiveHourBlocks = berlinClock.fiveHourBlocks.enumerated()
            .map({ (index, active) in
                Block(id: "fiveHourBlock-\(index)", active: active, color: .red)
            })
        self.oneHourBlocks = berlinClock.oneHourBlocks.enumerated()
            .map({ (index, active) in
                Block(id: "oneHourBlock-\(index)", active: active, color: .red)
            })
        self.fiveMinuteBlocks = berlinClock.fiveMinuteBlocks.enumerated()
            .map({ (index, active) in
                let incrementedIndex = index + 1 // .enumerated indexes are zerobased.
                let color: Color = (incrementedIndex % 3 == 0) ? .red : .yellow

                return Block(id: "fiveMinuteBlock-\(index)", active: active, color: color)
            })
        self.oneMinuteBlocks = berlinClock.oneMinuteBlocks.enumerated()
            .map({ (index, active) in
                Block(id: "oneMinuteBlock-\(index)", active: active, color: .red)
            })
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        self.timeDescription = dateFormatter.string(from: date)
    }
}
