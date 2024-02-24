//
//  BadgeView.swift
//  NeverTooLate
//
//  Created by 최민규 on 2/10/24.
//

import SwiftUI

struct BadgePickerView: View {
    @EnvironmentObject var badgeModel: BadgeModel
    @State private var selectedSymbolIndex = 0
    @State private var selectedColor = Color.red
    @State private var selectedSymbol = "heart"
    @State private var selectedWeight = 1
    @Binding var isPresented: Bool
    let fontWeightInt = [0, 1, 2, 3]
    let fontWeights: [Font.Weight] = [.thin, .regular, .bold, .black]
    let fontWeightLabels = ["Thin", "Regular", "Bold", "Black"]
    
    var body: some View {
        VStack {
            Image(systemName: selectedSymbol)
                .resizable()
                .fontWeight(fontWeights[selectedWeight])
                .aspectRatio(contentMode: .fit)
                .foregroundColor(selectedColor)
                .padding(8)
                .frame(width: 80, height: 80)
            
            Picker("Symbol", selection: $selectedSymbol) {
                ForEach(badgeModel.symbolList, id: \.self) { symbol in
                    Image(systemName: symbol)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.black)
                        .padding(8)
                        .frame(width: 80, height: 80)
                        .tag(symbol)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            Picker("FontWeight", selection: $selectedWeight) {
                ForEach(0..<fontWeights.count, id: \.self) { index in
                    Text(fontWeightLabels[index]).tag(fontWeights[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            
            ColorPicker("Primary Color", selection: $selectedColor)
                .padding()
            
            Button("Save Badge") {
                let badge = Badge(name: selectedSymbol, symbol: selectedSymbol, color: changeColorToArray(selectedColor), fontWeight: selectedWeight)
                badgeModel.addBadge(badge)
                isPresented = false
            }
            .padding()
        }
    }
}

func changeColorToArray(_ color: Color) -> [CGFloat] {
    let uiColor = UIColor(color)
    
    var red: CGFloat = 0
    var green: CGFloat = 0
    var blue: CGFloat = 0
    var alpha: CGFloat = 0
    uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
    
    return [red, green, blue, alpha]
}

func changeArrayToColor(_ array: [CGFloat]) -> Color {
    guard array.count >= 3 else {
        return Color.black
    }
    
    let red = array[0]
    let green = array[1]
    let blue = array[2]
    
    let alpha: CGFloat = array.count > 3 ? array[3] : 1.0
    
    return Color(red: Double(red), green: Double(green), blue: Double(blue), opacity: Double(alpha))
}
