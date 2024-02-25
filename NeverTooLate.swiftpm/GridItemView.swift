//
//  GridItemView.swift
//
//
//  Created by 최민규 on 2/10/24.
//

import SwiftUI

struct GridItemView: View {
    let badge: Badge
    let fontWeights: [Font.Weight] = [.thin, .regular, .bold, .black]
    
    var body: some View {
        NavigationLink(destination: DrawingView(badge: badge)) {
            GeometryReader { geo in
                ZStack {
                    Circle()
                        .foregroundStyle(LinearGradient(colors: [.gray.opacity(0.1), .white], startPoint: .top, endPoint: .bottom))
                    Circle()
                        .strokeBorder(lineWidth: geo.size.height / 10)
                        .foregroundStyle(Color.badgeGradient1)
                    Circle()
                        .strokeBorder(lineWidth: geo.size.height / 50)
                        .foregroundStyle(Color.badgeGradient2)
                    Image(systemName: badge.symbol)
                        .resizable()
                        .fontWeight(fontWeights[badge.fontWeight])
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(changeArrayToColor(badge.color))
                        .padding(8)
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(0.4)
                    
                }
            }
        }
    }
}

#Preview {
    GridItemView(badge: Badge(name: "", symbol: "arrow.left", color: [1,0,0], fontWeight: 2))
}
