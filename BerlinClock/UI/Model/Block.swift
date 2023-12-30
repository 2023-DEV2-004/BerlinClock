//
//  Block.swift
//  BerlinClock
//

import Foundation
import SwiftUI

struct Block: Equatable, Hashable, Identifiable {
    let id: String
    let active: Bool
    let color: Color
}
