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
    @EnvironmentObject var colorPickerModel: ColorPickerModel
    @Binding var pkCanvasView: PKCanvasView
    @Binding var drawingImage: UIImage?
    
    @State private var showingAlert = false
    @State private var isSharing = false
    @State private var colorPickerSize: CGFloat = 16 //누르면 커지는 효과 16고정
    @State private var colorPickerOpacity: Bool = false //누르면 커지는 밝아지는 효과
    @State private var selectedWeight = 1
    let fontWeightInt = [0, 1, 2, 3]
    let fontWeights: [Font.Weight] = [.thin, .regular, .bold, .black]
    let fontWeightLabels = ["Thin", "Regular", "Bold", "Black"]
    
    let badge: Badge
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(colors: [.white, Color(hex: 0xD1D1D1)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                ZStack {
                    VStack {
                        ZStack {
                            Circle()
                                .foregroundStyle(.white)
                            Circle()
                                .foregroundStyle(LinearGradient(colors: [.gray.opacity(0.1), .white], startPoint: .top, endPoint: .bottom))
                            Image(systemName: badge.symbol)
                                .resizable()
                                .fontWeight(fontWeights[badgeModel.selectedBadges[badgeModel.selectedBadges.lastIndex(of: badge)!].fontWeight])
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(
                                    changeArrayToColor(badgeModel.selectedBadges[badgeModel.selectedBadges.lastIndex(of: badge)!].color)
                                )
                                .padding(8)
                                .aspectRatio(contentMode: .fit)
                                .scaleEffect(0.4)
                            PKCanvas(canvasView: $pkCanvasView)
                                .cornerRadius(geo.size.height)
                            Circle()
                                .strokeBorder(lineWidth: geo.size.height / 12)
                                .foregroundStyle(Color.badgeGradient1)
                            Circle()
                                .strokeBorder(lineWidth: geo.size.height / 60)
                                .foregroundStyle(Color.badgeGradient2)
                        }
                        .frame(width: geo.size.height * 7 / 10, height: geo.size.height * 7 / 10)

                        VStack {
                            colorPickerView
                            Spacer()
                                .frame(height: 32)
                            Picker("FontWeight", selection: $badgeModel.selectedBadges[badgeModel.selectedBadges.lastIndex(of: badge)!].fontWeight) {
                                ForEach(0..<fontWeights.count, id: \.self) { index in
                                    Text(fontWeightLabels[index]).tag(fontWeights[index])
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                        }
                        .padding()
                        
                        Spacer()
                            .frame(height: 64)
                    }
                    
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
                .padding(32)
            }
        }
    }
    
    func shareDrawing() {
        isSharing = true
    }
    func saveDrawing() {
        let image = pkCanvasView.drawing.image(from: pkCanvasView.bounds, scale: UIScreen.main.scale)
        drawingImage = image
    }
}


extension DrawingView {
    var colorPickerView: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                LinearGradient(gradient: Gradient(colors: [colorPickerModel.color1, colorPickerModel.color2, colorPickerModel.color3, colorPickerModel.color4]), startPoint: .leading, endPoint: .trailing)
                    .frame(width: geometry.size.width, height: 48 - colorPickerSize)
                    .cornerRadius(16)
                    .opacity(colorPickerOpacity ? 1 : 0.7)
                    .shadow(color: .black.opacity(0.3), radius: 4, x: 0, y: 3)
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black.opacity(1), lineWidth: 2)
                    }
                ZStack {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.black.opacity(0.8), lineWidth: 3)
                        .frame(width: 24, height: 40 - colorPickerSize)
                        .shadow(color: .black.opacity(0.4), radius: 4, x: 0, y: 3)
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.black.opacity(0.4), lineWidth: 2)
                        .frame(width: 16, height: 32 - colorPickerSize)
                    
                }
                .opacity(colorPickerOpacity ? 1 : 0.7)
                .offset(x: geometry.size.width * 0.05 + (CGFloat(colorPickerModel.pickerValue) * geometry.size.width) * 0.9 - 12)
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { gesture in
                            updateValue(with: gesture, in: geometry)
                            if let index = badgeModel.selectedBadges.lastIndex(of: badge) {
                                badgeModel.selectedBadges[index].color = colorPickerModel.pickerValueToColor(value: colorPickerModel.pickerValue)
                            }
//                            print(colorPickerModel.pickerValue)
                            withAnimation(.easeInOut(duration: 0.2)) {
                                colorPickerSize = 0
                                colorPickerOpacity = true
                            }
                        }
                        .onEnded { gesture in
                            withAnimation(.easeInOut(duration: 0.2)) {
                                colorPickerSize = 16
                                colorPickerOpacity = false
                            }
                        }
                )
            }//ZStack
            .offset(y: -8 + (colorPickerSize / 2))
            
        }//GeometryReader
    }
    func updateValue(with gesture: DragGesture.Value, in geometry: GeometryProxy) {
        let newValue = gesture.location.x / geometry.size.width
        colorPickerModel.pickerValue = min(max(Double(newValue), 0), 1)
    }
}
//
//extension DrawingView {
//    var weightPickerView: some View {
//        
//    }
//}
