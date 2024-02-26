//  GridView.swift
//
//
//  Created by 최민규 on 2/10/24.
//

import SwiftUI

struct GridView: View {
    @EnvironmentObject var badgeModel: BadgeModel
    
    private static let columns = 3
    @State private var isEditing = false
    @State private var isDrawEditing = false
    @State private var showingDeleteAlert = false
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: columns)
    @State private var isPresentingShareSheet = false
    @State private var capturedImage: UIImage?
    @State private var instructionStarted = false
    @State private var instructionEnded = false
    @State private var isDone = false
    
    let badgePosition: [CGPoint] = [
        CGPoint(x: -60, y: -280),
        CGPoint(x: -200, y: -200),
        CGPoint(x: 140, y: -230),
        CGPoint(x: 0, y: -150),
        CGPoint(x: -160, y: -400),
        CGPoint(x: 100, y: -380),
        CGPoint(x: -300, y: -350),
        CGPoint(x: 280, y: -290),
        CGPoint(x: -80, y: -540),
        CGPoint(x: 230, y: -510),
        CGPoint(x: -240, y: -640),
        CGPoint(x: 120, y: -630),
    ]
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, Color(hex: 0xD9D9D9)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Image("bowlBack")
                    .resizable()
                    .frame(width: 700, height: 280)
            }
            VStack {
                Spacer()
                ZStack {
                    ForEach(badgeModel.selectedBadges) { badge in
                        GridItemView(badge: badge, isEditing: $isEditing, isDrawEditing: $isDrawEditing)
                            .environmentObject(badgeModel)
                            .shadow(color: Color(red: 0.8, green: 0.8, blue: 0.8, opacity: 0.5), radius: 8)
                            .offset(x: badgePosition[badgeModel.selectedBadges.lastIndex(of: badge)!].x, y: badgePosition[badgeModel.selectedBadges.lastIndex(of: badge)!].y)
                            .padding()
                    }
                }
            }
            VStack {
                Spacer()
                Image("bowlFront")
                    .resizable()
                    .frame(width: 700, height: 280)
            }
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Button {
                        if !isDrawEditing {
                            capturedImage = captureScreenshot()
                            isPresentingShareSheet = true
                        }
                    } label: {
                        if isDrawEditing {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundStyle(.teal)
                                .bold()
                                .font(.system(size: 24))
                                .padding()
                                .background {
                                    Circle()
                                        .frame(width: 60)
                                        .foregroundStyle(Color.white)
                                        .shadow(color: .gray, radius: 8, x: 0, y: 4)
                                }
                                .padding(.horizontal, 32)
                                .opacity(0.3)
                        } else {
                            Image(systemName: "square.and.arrow.up")
                                .foregroundStyle(.teal)
                                .bold()
                                .font(.system(size: 24))
                                .padding()
                                .background {
                                    Circle()
                                        .frame(width: 60)
                                        .foregroundStyle(Color.white)
                                        .shadow(color: .gray, radius: 8, x: 0, y: 4)
                                }
                                .padding(.horizontal, 32)
                        }
                    }
                    
                    Button {
                        isDrawEditing.toggle()
                    } label: {
                        if isDrawEditing {
                            Text("Done")
                                .foregroundStyle(.teal)
                                .bold()
                                .font(.system(size: 24))
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 150)
                                        .foregroundStyle(Color.white)
                                        .shadow(color: .gray, radius: 8, x: 0, y: 4)
                                }
                                .padding(32)
                        } else {
                            Image(systemName: "pencil")
                                .foregroundStyle(instructionStarted ? .white : .teal)
                                .bold()
                                .font(.system(size: 32))
                                .padding()
                                .background {
                                    Circle()
                                        .frame(width: 60)
                                        .foregroundStyle(instructionStarted ? Color.teal.opacity(0.8) : Color.white)
                                        .shadow(color: .gray, radius: 8, x: 0, y: 4)
                                }
                                .padding(32)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(isEditing ? "Delete All" : "") {
                            if isEditing {
                                showingDeleteAlert = true
                            }
                        }
                        Button(isEditing ? "Done" : "Edit") {
                            isEditing.toggle()
                        }
                    }
                }
            }
            .alert(isPresented: $showingDeleteAlert) {
                Alert(
                    title: Text("Delete All Badges"),
                    message: Text("Are you sure you want to delete all badges?"),
                    primaryButton: .destructive(Text("Delete"), action: {
                        badgeModel.removeAll()
                        isEditing = false
                    }),
                    secondaryButton: .cancel()
                )
            }
            .sheet(isPresented: $isPresentingShareSheet, content: {
                if let image = capturedImage {
                    ShareSheet(activityItems: [image])
                }
            })
            
            VStack {
                Text("IT'S NEVER TOO LATE!")
                    .font(Font.custom("Cinzel-Bold", size: 60)).foregroundColor(.black)
                    .shadow(radius: 7, x: 0, y: 10)
                Text("Never give up on your dreams and good luck~")
                    .font(Font.custom("Cinzel-Bold", size: 30)).foregroundColor(.black)
                    .shadow(radius: 7, x: 0, y: 10)
                Spacer()
                HStack {
                    Image("me")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                    Text(instructionStarted ? "Click the pencil to draw anything!\nYou can even change the colors" : "Click the badge to flip!")
                        .font(Font.custom("Cinzel-Bold", size: 30)).foregroundColor(.black)
                        .shadow(radius: 7, x: 0, y: 10)
                    Spacer()
                }
                .opacity(isDone ? 0 : 1)
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                withAnimation(.easeInOut(duration: 0.5)) {
                    instructionStarted = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        instructionEnded = true
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        isDone = true
                    }
                }
            }
        }
    }
    
    func captureScreenshot() -> UIImage {
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        let scale = UIScreen.main.scale
        
        UIGraphicsBeginImageContextWithOptions(window!.frame.size, false, scale)
        
        window?.drawHierarchy(in: window!.frame, afterScreenUpdates: true)
        
        guard let screenshot = UIGraphicsGetImageFromCurrentImageContext() else {
            return UIImage()
        }
        
        UIGraphicsEndImageContext()
        
        return screenshot
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView().environmentObject(BadgeModel())
            .previewDevice("iPad (8th generation)")
    }
}
