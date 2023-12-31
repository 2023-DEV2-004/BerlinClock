//
//  CurrentCalendarFactory.swift
//  BerlinClock
//

import Foundation

struct CurrentCalendarFactory: CalendarFactory {
    
    func create() -> Calendar {
        Calendar(identifier: .iso8601)
    }
    
}
