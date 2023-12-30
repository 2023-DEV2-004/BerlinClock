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
    
    private struct Constants {
        static let padding: CGFloat = 5
        static let lineWidth: CGFloat = 5
        static let strokeColor: Color = .primary
        static let sectionHeight: CGFloat = 100
    }

    var body: some View {
        VStack {
            secondHighlightSection
            
            Spacer()
        }
        .padding(Constants.padding)
    }
    
    @ViewBuilder
    private var secondHighlightSection: some View {
        HStack {
            Spacer()
            Circle()
                .stroke(Constants.strokeColor, lineWidth: Constants.lineWidth)
                .fill(viewModel.secondHighlightColor)
            Spacer()
        }
        .frame(height: Constants.sectionHeight)
    }

}

#Preview {
    BerlinClockView(viewModel: BerlinClockViewModel(berlinClock: BerlinClock(date: Date(), calendar: .current), date: Date()))
}
