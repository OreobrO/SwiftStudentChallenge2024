//
//  GridItemView.swift
//
//
//  Created by 최민규 on 2/10/24.
//

import SwiftUI
import PencilKit

struct GridItemView: View {
    @EnvironmentObject var badgeModel: BadgeModel
    @State private var pkCanvasView = PKCanvasView()

    let badge: Badge
    let fontWeights: [Font.Weight] = [.thin, .regular, .bold, .black]
    @State private var rotationEffect = false
    @State private var isFlipped = false
    @Binding var isEditing: Bool
    
    var body: some View {
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
                PKCanvas(canvasView: $pkCanvasView)
                    .frame(width: geo.size.height * 8 / 10, height: geo.size.height * 8 / 10)
                    .cornerRadius(geo.size.width)
                ZStack {
                    Circle()
                        .foregroundStyle(Color.badgeGradient1)
                    Text(badge.name)
                        .foregroundStyle(.black)
                        .rotation3DEffect(
                            Angle(degrees: 180),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                }
                .opacity(isFlipped ? 1 : 0)
            }
            .rotation3DEffect(
                Angle(degrees: rotationEffect ? 180 : 0),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .overlay(alignment: .top) {
                if isEditing {
                    HStack {
                        NavigationLink(destination: DrawingView(pkCanvasView: $pkCanvasView, badge: badge)) {
                            Image(systemName: "pencil.circle.fill")
                                .font(Font.title)
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.white, .gray)
                        }
                        .simultaneousGesture(TapGesture().onEnded {
                            isEditing = false
                        })
                        Spacer()
                        Button {
                            withAnimation {
                                badgeModel.removeBadge(badge)
                            }
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(Font.title)
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.white, .red)
                        }
                    }
                }
            }
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.3)) {
                    rotationEffect.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                    isFlipped.toggle()
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(.easeInOut(duration: 0.3)) {
                        rotationEffect.toggle()
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.15) {
                    isFlipped.toggle()
                }
            }
        }
    }
}

#Preview {
    GridItemView(badge: Badge(name: "", symbol: "arrow.left", color: [1,0,0], fontWeight: 2), isEditing: .constant(false))
}
