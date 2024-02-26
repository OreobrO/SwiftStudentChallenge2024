//
//  ColorExtension.swift
//  NeverTooLate
//
//  Created by 최민규 on 2/25/24.
//

import SwiftUI

extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        let red = Double((hex >> 16) & 0xff) / 255.0
        let green = Double((hex >> 8) & 0xff) / 255.0
        let blue = Double(hex & 0xff) / 255.0
        self.init(red: red, green: green, blue: blue, opacity: alpha)
    }

    static let badgeGradient1 = LinearGradient(colors: [Color(hex: 0xC5C5C5), Color(hex: 0xF1F1F1)], startPoint: .top, endPoint: .bottom)
    static let badgeGradient2 = LinearGradient(colors: [Color(hex: 0xC5C5C5), Color(hex: 0xF1F1F1)], startPoint: .bottom, endPoint: .top)
    static let userPink = Color(hex: 0xDC7E7E)
    static let userYellow = Color(hex: 0xD4DA97)
    static let userCyan = Color(hex: 0x8BB2B2)
    static let userBlue = Color(hex: 0x8A8DC5)
}


