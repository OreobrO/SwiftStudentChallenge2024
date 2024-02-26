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
    @EnvironmentObject var colorPickerModel: ColorPickerModel
    
    @State private var pkCanvasView = PKCanvasView()
    @State private var drawingImage: UIImage?
    
    let badge: Badge
    let fontWeights: [Font.Weight] = [.thin, .regular, .bold, .black]
    @State private var rotationEffect = false
    @State private var isFlipped = false
    @State private var floatingAnimation = false
    
    @Binding var isEditing: Bool
    @Binding var isDrawEditing: Bool
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Circle()
                    .foregroundStyle(.white)
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
                Image(uiImage: drawingImage ?? UIImage())
                    .resizable()
                    .frame(width: geo.size.height * 8 / 10, height: geo.size.height * 8 / 10)
                    .cornerRadius(20)
                ZStack {
                    Circle()
                        .foregroundStyle(Color.badgeGradient1)
                    Text(badge.name)
                        .font(.body)
                        .foregroundStyle(.black)
                        .rotation3DEffect(
                            Angle(degrees: 180),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                        )
                }
                .opacity(isFlipped ? 1 : 0)
                if isDrawEditing {
                    NavigationLink(destination:
                                    DrawingView(pkCanvasView: $pkCanvasView, drawingImage: $drawingImage, badge: badge)
                        .environmentObject(badgeModel)
                        .environmentObject(colorPickerModel)
                    ) {
                        Circle()
                            .foregroundStyle(Color.white.opacity(0.3))
                    }
                }
                if isEditing {
                    Button {
                        withAnimation {
                            badgeModel.removeBadge(badge)
                        }
                    } label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(Color.white.opacity(0.3))
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 24))
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.white, .red)
                                .opacity(0.7)
                        }
                    }
                } else if isDrawEditing {
                    NavigationLink(destination:
                                    DrawingView(pkCanvasView: $pkCanvasView, drawingImage: $drawingImage, badge: badge)
                        .environmentObject(badgeModel)
                        .environmentObject(colorPickerModel)
                    ) {
                        Image(systemName: "pencil.circle.fill")
                            .font(.system(size: 24))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.white, .gray)
                            .opacity(0.5)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        isDrawEditing = false
                    })
                }
            }
            .onAppear {
                if [1, 3, 5].contains(badgeModel.selectedBadges.lastIndex(of: badge)!) {
                    withAnimation(.easeInOut(duration: 1).repeatForever()) {
                        floatingAnimation.toggle()
                    }
                } else if [1, 3, 5].contains(badgeModel.selectedBadges.lastIndex(of: badge)!) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        withAnimation(.easeInOut(duration: 1).repeatForever()) {
                            floatingAnimation.toggle()
                        }
                    }
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                        withAnimation(.easeInOut(duration: 1).repeatForever()) {
                            floatingAnimation.toggle()
                        }
                    }
                }
            }
            .rotation3DEffect(
                Angle(degrees: rotationEffect ? 180 : 0),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .onTapGesture {
                if !isDrawEditing {
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
        .frame(width: 160, height: 160)
        .rotation3DEffect(
            Angle(degrees: [1, 4, 6, 11].contains(badgeModel.selectedBadges.lastIndex(of: badge)!) ? 30 : 0),
            axis: (x: 0.3, y: 1.0, z: 0.0), perspective: 0
        )
        .rotationEffect([1, 4, 6, 11].contains(badgeModel.selectedBadges.lastIndex(of: badge)!) ? Angle(degrees: -15) : .degrees(0))
        .rotation3DEffect(
            Angle(degrees: [5, 7, 10].contains(badgeModel.selectedBadges.lastIndex(of: badge)!) ? -25 : 0),
            axis: (x: 0.3, y: 1.0, z: 0.0), perspective: 0
        )
        .rotationEffect([5, 7, 10].contains(badgeModel.selectedBadges.lastIndex(of: badge)!) ? Angle(degrees: 25) : .degrees(0))
        .offset(y: floatingAnimation ? -20 : 0)
        
    }
}

