//
//  BerlinClockViewModel.swift
//  BerlinClock
//

import Foundation
import SwiftUI

class BerlinClockViewModel {
    
    private let berlinClock: BerlinClock

    var secondHighlightColor: Color = .clear
    
    init(berlinClock: BerlinClock) {
        self.berlinClock = berlinClock
        self.secondHighlightColor = berlinClock.secondHighlighted ? .yellow : .clear
    }
}
