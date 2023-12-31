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
    
    private struct Accessibility {
        static let secondHighlightIdentifier = "secondHighlightIdentifier"
        static let fiveHourBlockSectionIdentifier = "fiveHourBlockSectionIdentifier"
        static let oneHourBlockSectionIdentifier = "oneHourBlockSectionIdentifier"
        static let fiveMinuteBlockSectionIdentifier = "fiveMinuteBlockSectionIdentifier"
        static let oneMinuteBlockSectionIdentifier = "oneMinuteBlockSectionIdentifier"
        static let timeDescriptionIdentifier = "timeDescriptionIdentifier"
    }

    var body: some View {
        VStack {
            SecondSectionView(color: self.viewModel.secondHighlightColor)
                .frame(height: Constants.sectionHeight)
                .accessibilityIdentifier(Accessibility.secondHighlightIdentifier)
            BlockSectionView(blocks: self.viewModel.fiveHourBlocks)
                .frame(height: Constants.sectionHeight)
                .accessibilityIdentifier(Accessibility.fiveHourBlockSectionIdentifier)
            BlockSectionView(blocks: self.viewModel.oneHourBlocks)
                .frame(height: Constants.sectionHeight)
                .accessibilityIdentifier(Accessibility.oneHourBlockSectionIdentifier)
            BlockSectionView(blocks: self.viewModel.fiveMinuteBlocks)
                .frame(height: Constants.sectionHeight)
                .accessibilityIdentifier(Accessibility.fiveMinuteBlockSectionIdentifier)
            BlockSectionView(blocks: self.viewModel.oneMinuteBlocks)
                .frame(height: Constants.sectionHeight)
                .accessibilityIdentifier(Accessibility.oneMinuteBlockSectionIdentifier)
            
            Spacer()
            
            TimeDescriptionView(time: self.viewModel.timeDescription)
                .accessibilityIdentifier(Accessibility.timeDescriptionIdentifier)
            
            Spacer()
        }
        .padding(Constants.padding)
        .onAppear(perform: {
            self.viewModel.subscribeToChanges()
        })
    }
    
}

#Preview {
    BerlinClockView(viewModel: BerlinClockViewModel(calendarFactory: PreviewCalendarFactory(calendar: .current),
                                                    datePublisherFactory: PreviewDatePublisherFactory(date: Date())))
}
