//
//  BerlinClockApp.swift
//  BerlinClock
//

import SwiftUI

@main
struct BerlinClockApp: App {
    
    let currentCalendarFactory = CurrentCalendarFactory()
    let realDatePublisherFactory = RealDatePublisherFactory()
    
    
    var body: some Scene {
        WindowGroup {
            BerlinClockView(viewModel: BerlinClockViewModel(calendarFactory: currentCalendarFactory,
                                                            datePublisherFactory: realDatePublisherFactory))
        }
    }
}
