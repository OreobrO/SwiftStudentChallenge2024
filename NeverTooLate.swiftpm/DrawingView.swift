//
//  DrawingView.swift
//  NeverTooLate
//
//  Created by 최민규 on 2/10/24.
//

import SwiftUI
import PencilKit

struct DrawingView: View {
    @EnvironmentObject var badgeModel: BadgeModel
    @State private var showingAlert = false
    @Binding var pkCanvasView: PKCanvasView
    @State private var isSharing = false
    @Binding var drawingImage: UIImage?
    
    let badge: Badge
    let fontWeights: [Font.Weight] = [.thin, .regular, .bold, .black]
    
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
                    .cornerRadius(geo.size.height)
                VStack {
                    HStack {
                        Button(action: saveDrawing) {
                            Image(systemName: "arrow.up")
                        }
                        
                        Spacer()
                        
                        Button(action: shareDrawing) {
                            Image(systemName: "square.and.arrow.up")
                        }.sheet(isPresented: $isSharing) {
                            let image = pkCanvasView.drawing.image(from: pkCanvasView.bounds, scale: UIScreen.main.scale)
                            ShareSheet(
                                activityItems: [image],
                                excludedActivityTypes: [])
                            
                        }
                        .frame(width: 30, height: 30)
                        .padding(10)
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(20)
                    }
                    Spacer()
                }
            }
        }
        .padding(50)
    }
    
    func shareDrawing() {
        isSharing = true
    }
    func saveDrawing() {
        let image = pkCanvasView.drawing.image(from: pkCanvasView.bounds, scale: UIScreen.main.scale)
        drawingImage = image
    }
}
