//
//  Badge.swift
//  NeverTooLate
//
//  Created by 최민규 on 2/12/24.
//

import SwiftUI

struct Badge: Identifiable, Codable, Hashable {
    let id = UUID()
    let name: String
    let symbol: String
    var color: [CGFloat]
    var fontWeight: Int
}

extension Badge: Equatable {
    static func ==(lhs: Badge, rhs: Badge) -> Bool {
        return lhs.id == rhs.id
    }
}
