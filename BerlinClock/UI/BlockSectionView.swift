//
//  BlockSectionView.swift
//  BerlinClock
//

import SwiftUI

struct BlockSectionView: View {
    
    let blocks: [Block]
    
    var body: some View {
        HStack {
            ForEach(self.blocks) { block in
                BlockView(active: block.active, activeColor: block.color)
            }
        }
    }
}

#Preview {
    BlockSectionView(blocks: [Block(id: "1", active: true, color: .red),
                              Block(id: "2", active: true, color: .red),
                              Block(id: "3", active: true, color: .yellow),
                              Block(id: "4", active: false, color: .red)])
    .frame(height: 100)
}
