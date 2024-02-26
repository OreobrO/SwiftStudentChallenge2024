//
//  ColorPickerModel.swift
//  NoonMoaApt
//
//  Created by 최민규 on 2023/08/27.
//

import Foundation
import SwiftUI

class ColorPickerModel: ObservableObject {
    @Published var pickerValue: Double = 0.25
    //캐릭터 테마컬러 그라데이션
    let color1: Color = Color.userBlue
    let color2: Color = Color.userPink
    let color3: Color = Color.userYellow
    let color4: Color = Color.userCyan
}

extension ColorPickerModel {
    func pickerValueToColor(value: Double) -> [CGFloat] {
        let (r1, g1, b1) = (Double(color1.toArray[0]), Double(color1.toArray[1]), Double(color1.toArray[2]))
        let (r2, g2, b2) = (Double(color2.toArray[0]), Double(color2.toArray[1]), Double(color2.toArray[2]))
        let (r3, g3, b3) = (Double(color3.toArray[0]), Double(color3.toArray[1]), Double(color3.toArray[2]))
        let (r4, g4, b4) = (Double(color4.toArray[0]), Double(color4.toArray[1]), Double(color4.toArray[2]))
        
        let x = value
        var yR = 0.0
        var yG = 0.0
        var yB = 0.0
        
        if x >= 0 && x < 0.33 {
            yR = r1 + ((r2 - r1) / 0.33) * x
            yG = g1 + ((g2 - g1) / 0.33) * x
            yB = b1 + ((b2 - b1) / 0.33) * x
        } else if x >= 0.33 && x < 0.66 {
            yR = r2 + ((r3 - r2) / 0.33) * (x - 0.33)
            yG = g2 + ((g3 - g2) / 0.33) * (x - 0.33)
            yB = b2 + ((b3 - b2) / 0.33) * (x - 0.33)
        } else if x >= 0.66 && x <= 1 {
            yR = r3 + ((r4 - r3) / 0.34) * (x - 0.66)
            yG = g3 + ((g4 - g3) / 0.34) * (x - 0.66)
            yB = b3 + ((b4 - b3) / 0.34) * (x - 0.66)
        }
        
        return [CGFloat(yR), CGFloat(yG), CGFloat(yB)]
    }
}

extension Color {
    var toArray: [CGFloat] {
        let uiColor = UIColor(self)
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return [CGFloat(red), CGFloat(green), CGFloat(blue)]
    }
}

extension Array where Element == CGFloat {
    var toColor: Color {
        guard count == 3 else {
            return .clear
        }
        
        let red = Double(self[0])
        let green = Double(self[1])
        let blue = Double(self[2])
        
        return Color(red: red, green: green, blue: blue)
    }
}

