//
//  BerlinClockViewModel.swift
//  BerlinClock
//

import Foundation
import SwiftUI
import Combine

class BerlinClockViewModel: ObservableObject {
    
    private let calendarFactory: any CalendarFactory
    private let datePublisherFactory: any DatePublisherFactory

    @Published var secondHighlightColor: Color = .clear
    @Published var fiveHourBlocks: [Block] = []
    var oneHourBlocks: [Block] = []
    var fiveMinuteBlocks: [Block] = []
    var oneMinuteBlocks: [Block] = []
    var timeDescription: String = ""
    
    init(calendarFactory: any CalendarFactory,
         datePublisherFactory: any DatePublisherFactory,
         berlinClock: BerlinClock,
         date: Date) {
        self.calendarFactory = calendarFactory
        self.datePublisherFactory = datePublisherFactory

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
    
    func subscribeToChanges() {
        self.subscribeToSecondHighlightChanges()
        self.subscribeToFiveHourBlockChanges()
    }
    
    private func subscribeToSecondHighlightChanges() {
        self.berlinClockPublisher()
            .map(\.secondHighlighted)
            .map({ $0 ? .yellow : .clear })
            .assign(to: &$secondHighlightColor)
    }
    
    private func subscribeToFiveHourBlockChanges() {
        self.berlinClockPublisher()
            .map(\.fiveHourBlocks)
            .map { fiveHourBlocks in
                fiveHourBlocks.enumerated().map({ (index, active) in Block(id: "fiveHourBlock-\(index)", active: active, color: .red) })
            }
            .assign(to: &$fiveHourBlocks)
    }
    
    private func berlinClockPublisher() -> AnyPublisher<BerlinClock, Never> {
        self.datePublisher()
            .map({ BerlinClock(date: $0, calendar: self.calendarFactory.create()) })
            .eraseToAnyPublisher()
    }
    
    private func datePublisher() -> AnyPublisher<Date, Never> {
        self.datePublisherFactory.create()
    }
}
