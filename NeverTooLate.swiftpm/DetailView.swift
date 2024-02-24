//
//  File.swift
//  
//
//  Created by 최민규 on 2/10/24.
//

import SwiftUI

struct DetailView: View {
    let badge: Badge
    let fontWeights: [Font.Weight] = [.thin, .regular, .bold, .black]

    var body: some View {
        Image(systemName: badge.symbol)
            .resizable()
            .fontWeight(fontWeights[badge.fontWeight])
            .aspectRatio(contentMode: .fit)
            .foregroundColor(changeArrayToColor(badge.color))
            .padding(8)
            .frame(width: 80, height: 80)
    }
}
