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
    @State private var pkCanvasView = PKCanvasView()
    @State private var isSharing = false
    @State private var isBackgroundHiding = false
    
    let badge: Badge
    let fontWeights: [Font.Weight] = [.thin, .regular, .bold, .black]

    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.white)
                .shadow(color: Color(red: 0.8, green: 0.8, blue: 0.8, opacity: 0.5), radius: 8)
            
                Image(systemName: badge.symbol)
                    .resizable()
                    .fontWeight(fontWeights[badge.fontWeight])
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(changeArrayToColor(badge.color))
                    .padding(8)
                    .frame(width: 200, height: 200)
            
            GeometryReader { geo in
                PKCanvas(canvasView: $pkCanvasView)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .cornerRadius(20)
                
                VStack(alignment: .trailing) {
                    HStack {
                        
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
                    .padding(20)
                }
            }
        }
        .padding(50)
    }
    
    func shareDrawing() {
        isSharing = true
    }
}
