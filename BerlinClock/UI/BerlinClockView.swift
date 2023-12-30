//
//  BerlinClockView.swift
//  BerlinClock
//
//  Created by Dieter Vogels on 30/12/2023.
//

import Foundation
import SwiftUI

struct BerlinClockView: View {
    
    @StateObject var viewModel: BerlinClockViewModel
    
    var body: some View {
        Text("")
    }

}

#Preview {
    BerlinClockView(viewModel: BerlinClockViewModel(berlinClock: BerlinClock(date: Date(), calendar: .current), date: Date()))
}
