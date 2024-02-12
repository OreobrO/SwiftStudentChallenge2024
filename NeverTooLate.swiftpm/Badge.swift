//
//  Badge.swift
//  NeverTooLate
//
//  Created by 최민규 on 2/12/24.
//

import SwiftUI

struct Badge: Identifiable, Codable {
    let id = UUID()
    let symbol: String
    let primary: [CGFloat]
    let secondary: [CGFloat]
    let tertiary: [CGFloat]
}

extension Badge: Equatable {
    static func ==(lhs: Badge, rhs: Badge) -> Bool {
        return lhs.id == rhs.id
    }
}
