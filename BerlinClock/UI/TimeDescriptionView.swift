//
//  TimeDescriptionView.swift
//  BerlinClock
//

import Foundation
import SwiftUI

struct TimeDescriptionView: View {
    
    let time: String
    
    var body: some View {
        Text(self.time)
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

#Preview {
    TimeDescriptionView(time: "18:36")
}
