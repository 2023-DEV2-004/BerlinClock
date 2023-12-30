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
        }
        .padding(Constants.padding)
    }
    
}

#Preview {
    BerlinClockView(viewModel: BerlinClockViewModel(berlinClock: BerlinClock(date: Date(), calendar: .current), date: Date()))
}
