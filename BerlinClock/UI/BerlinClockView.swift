//
//  BerlinClockView.swift
//  BerlinClock
//

import Foundation
import SwiftUI

struct BerlinClockView: View {
    
    @StateObject var viewModel: BerlinClockViewModel
    
    private struct Constants {
        static let padding: CGFloat = 5
        static let sectionHeight: CGFloat = 100
    }

    var body: some View {
        VStack {
            SecondSectionView(color: self.viewModel.secondHighlightColor)
                .frame(height: Constants.sectionHeight)
            BlockSectionView(blocks: self.viewModel.fiveHourBlocks)
                .frame(height: Constants.sectionHeight)
            BlockSectionView(blocks: self.viewModel.oneHourBlocks)
                .frame(height: Constants.sectionHeight)
            BlockSectionView(blocks: self.viewModel.fiveMinuteBlocks)
                .frame(height: Constants.sectionHeight)
            BlockSectionView(blocks: self.viewModel.oneMinuteBlocks)
                .frame(height: Constants.sectionHeight)
            
            Spacer()
            
            TimeDescriptionView(time: self.viewModel.timeDescription)
            
            Spacer()
        }
        .padding(Constants.padding)
    }
    
}

#Preview {
    BerlinClockView(viewModel: BerlinClockViewModel(calendarFactory: PreviewCalendarFactory(calendar: .current),
                                                    datePublisherFactory: PreviewDatePublisherFactory(date: Date()),
                                                    berlinClock: BerlinClock(date: Date(), calendar: .current),
                                                    date: Date()))
}
