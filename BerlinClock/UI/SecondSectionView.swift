//
//  SecondSectionView.swift
//  BerlinClock
//

import Foundation
import SwiftUI

struct SecondSectionView: View {

    private struct Constants {
        static let lineWidth: CGFloat = 5
        static let strokeColor: Color = .primary
    }

    let color: Color

    var body: some View {
        HStack {
            Spacer()
            Circle()
                .stroke(Constants.strokeColor, lineWidth: Constants.lineWidth)
                .fill(color)
            Spacer()
        }
    }
}

#Preview {
    SecondSectionView(color: .yellow)
}
