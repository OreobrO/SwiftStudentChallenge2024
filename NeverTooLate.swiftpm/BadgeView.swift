//
//  BadgeView.swift
//  NeverTooLate
//
//  Created by 최민규 on 2/10/24.
//

import SwiftUI

struct BadgeView: View {
    @EnvironmentObject var badgeModel: BadgeModel
    @State private var selectedSymbolIndex = 0
    @State private var primaryColor = Color.red
    @State private var secondaryColor = Color.green
    @State private var tertiaryColor = Color.blue

    let symbols = ["heart", "star", "circle", "square"]

    var body: some View {
        VStack {
            Image(systemName: badgeModel.badges[0].symbol)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color(red: Double(badge.primary[0]), green: Double(badge.primary[0]), blue: Double(badge.primary[0])))
                .padding(8)
                .frame(width: 80, height: 80)
            Picker("Select Symbol", selection: $selectedSymbolIndex) {
                ForEach(0..<symbols.count) { index in
                    Image(systemName: symbols[index])
                        .tag(index)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            ColorPicker("Primary Color", selection: $primaryColor)
                .padding()
            ColorPicker("Secondary Color", selection: $secondaryColor)
                .padding()
            ColorPicker("Tertiary Color", selection: $tertiaryColor)
                .padding()

            Button("Save Badge") {
                let selectedSymbol = symbols[selectedSymbolIndex]
                let badge = Badge(symbol: selectedSymbol, primary: primaryColor.cgColor?.components ?? [], secondary: secondaryColor.cgColor?.components ?? [], tertiary: tertiaryColor.cgColor?.components ?? [])
                badgeModel.addBadge(badge)
            }
            .padding()
        }
    }
}
    
//    @State private var colors: [Color] = [.red, .blue, .green]
//    @State private var buttonColors: [Color] = [.red, .blue, .green, .yellow, .purple]
//    
//    var body: some View {
//        ZStack {
//            VStack {
//                Image(systemName: "homekit")
//                    .font(.system(size: 200))
//                    .foregroundStyle(colors[0], colors[1], colors[2])
//                HStack(spacing: 16){
//                    ForEach(buttonColors, id: \.self) { buttonColor in
//                        Button(action: {
//                            self.colors[0] = buttonColor
//                            self.colors[1] = buttonColors[(buttonColors.firstIndex(of: buttonColor)! + 1) % buttonColors.count]
//                            self.colors[2] = buttonColors[(buttonColors.firstIndex(of: buttonColor)! + 2) % buttonColors.count]
//                        }) {
//                            Text("\(buttonColor.description)")
//                                .foregroundStyle(.white)
//                                .frame(width: 100, height: 50)
//                                .background{
//                                    RoundedRectangle(cornerRadius: 16)
//                                        .foregroundStyle(buttonColor)
//                                }
//                        }
//                    }
//                }
//            }
//        }
//    }
//}

#Preview {
    BadgeView()
}
