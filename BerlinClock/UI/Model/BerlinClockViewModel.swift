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
    private let dateFormatter: DateFormatter

    @Published var secondHighlightColor: Color = .clear
    @Published var fiveHourBlocks: [Block] = []
    @Published var oneHourBlocks: [Block] = []
    @Published var fiveMinuteBlocks: [Block] = []
    @Published var oneMinuteBlocks: [Block] = []
    @Published var timeDescription: String = ""
    
    init(calendarFactory: any CalendarFactory,
         datePublisherFactory: any DatePublisherFactory) {
        self.calendarFactory = calendarFactory
        self.datePublisherFactory = datePublisherFactory
        
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
    }
    
    func subscribeToChanges() {
        self.subscribeToSecondHighlightChanges()
        self.subscribeToFiveHourBlockChanges()
        self.subscribeToOneHourBlockChanges()
        self.subscribeToFiveMinuteBlockChanges()
        self.subscribeToOneMinuteBlockChanges()
        self.subscribeToTimeDescriptionChanges()
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
    
    private func subscribeToOneHourBlockChanges() {
        self.berlinClockPublisher()
            .map(\.oneHourBlocks)
            .map { oneHourBlocks in
                oneHourBlocks.enumerated().map({ (index, active) in Block(id: "oneHourBlock-\(index)", active: active, color: .red) })
            }
            .assign(to: &$oneHourBlocks)
    }
    
    private func subscribeToFiveMinuteBlockChanges() {
        self.berlinClockPublisher()
            .map(\.fiveMinuteBlocks)
            .map { fiveMinuteBlocks in
                fiveMinuteBlocks.enumerated().map({ (index, active) in 
                    let incrementedIndex = index + 1 // .enumerated indexes are zerobased.
                    let color: Color = (incrementedIndex % 3 == 0) ? .red : .yellow

                    return Block(id: "fiveMinuteBlock-\(index)", active: active, color: color)
                })
            }
            .assign(to: &$fiveMinuteBlocks)
    }
    
    private func subscribeToOneMinuteBlockChanges() {
        self.berlinClockPublisher()
            .map(\.oneMinuteBlocks)
            .map { oneMinuteBlocks in
                oneMinuteBlocks.enumerated().map({ (index, active) in Block(id: "oneMinuteBlock-\(index)", active: active, color: .red) })
            }
            .assign(to: &$oneMinuteBlocks)
    }
    
    private func subscribeToTimeDescriptionChanges() {
        self.datePublisher()
            .map({ self.dateFormatter.string(from: $0) })
            .assign(to: &$timeDescription)
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
