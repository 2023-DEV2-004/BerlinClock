//
//  BlockView.swift
//  BerlinClock
//

import Foundation
import SwiftUI

struct BlockView: View {
    
    private struct Constants {
        static let borderWidth: CGFloat = 5
        static let strokeColor: Color = .primary
    }
    
    let active: Bool
    let activeColor: Color
    
    var body: some View {
        Rectangle()
            .fill(active ? activeColor : .clear)
            .border(Constants.strokeColor, width: Constants.borderWidth)
    }
}

#Preview {
    BlockView(active: true, activeColor: .red)
        .frame(width: 100, height: 100)
}
