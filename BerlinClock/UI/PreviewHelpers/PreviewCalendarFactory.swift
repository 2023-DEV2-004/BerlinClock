//
//  PreviewCalendarFactory.swift
//  BerlinClock
//

import Foundation

struct PreviewCalendarFactory: CalendarFactory {
    
    let calendar: Calendar
    
    func create() -> Calendar {
        Calendar(identifier: .chinese)
    }
    
}
