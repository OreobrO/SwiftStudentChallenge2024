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
    
    let badgePosition: [CGPoint] = [
        CGPoint(x: 0, y: -200),
        CGPoint(x: 100, y: -300),
        CGPoint(x: -200, y: -400),
        CGPoint(x: 300, y: -550),
        CGPoint(x: -300, y: -600),
        CGPoint(x: 400, y: -600),
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
                                .foregroundStyle(.teal)
                                .bold()
                                .font(.system(size: 32))
                                .padding()
                                .background {
                                   Circle()
                                        .frame(width: 60)
                                        .foregroundStyle(Color.white)
                                        .shadow(color: .gray, radius: 8, x: 0, y: 4)
                                }
                                .padding(32)
                        }
                    }
                }
            }
        .sheet(isPresented: $isPresentingShareSheet, content: {
                    if let image = capturedImage {
                        ShareSheet(activityItems: [image])
                    }
                })
        .navigationBarTitle("Template Gallery")
        .navigationBarTitleDisplayMode(.inline)
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


////
////  GridView.swift
////
////
////  Created by 최민규 on 2/10/24.
////
//
//import SwiftUI
//
//struct GridView: View {
//    @EnvironmentObject var badgeModel: BadgeModel
//
//    private static let columns = 3
//    @State private var isEditing = false
//    @State private var isDrawEditing = false
//    @State private var showingDeleteAlert = false
//
//    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: columns)
//
//    var body: some View {
//        ZStack {
//            LinearGradient(colors: [.white, Color(hex: 0xD9D9D9)], startPoint: .top, endPoint: .bottom)
//                .ignoresSafeArea()
//            VStack {
//                ScrollView {
//                    LazyVGrid(columns: gridColumns) {
//                        ForEach(badgeModel.selectedBadges) { badge in
//                            GeometryReader { geo in
//                                GridItemView(badge: badge, isEditing: $isEditing, isDrawEditing: $isDrawEditing)
//                                    .environmentObject(badgeModel)
//                            }
//                            .cornerRadius(8.0)
//                            .aspectRatio(1, contentMode: .fit)
//                            .shadow(color: Color(red: 0.8, green: 0.8, blue: 0.8, opacity: 0.5), radius: 8)
//                            .padding()
//                        }
//                    }
//                    .padding()
//                }
//            }
//            VStack {
//                Spacer()
//                HStack {
//                    Spacer()
//                    Button {
//                        isDrawEditing.toggle()
//                    } label: {
//                        if isDrawEditing {
//                            Text("Done")
//                                .foregroundStyle(.teal)
//                                .bold()
//                                .font(.system(size: 24))
//                                .padding()
//                                .background {
//                                    RoundedRectangle(cornerRadius: 150)
//                                        .foregroundStyle(Color.white)
//                                        .shadow(color: .gray, radius: 8, x: 0, y: 4)
//                                }
//                                .padding(32)
//                        } else {
//                            Image(systemName: "pencil")
//                                .foregroundStyle(.teal)
//                                .bold()
//                                .font(.system(size: 32))
//                                .padding()
//                                .background {
//                                    RoundedRectangle(cornerRadius: 150)
//                                        .foregroundStyle(Color.white)
//                                        .shadow(color: .gray, radius: 8, x: 0, y: 4)
//                                }
//                                .padding(32)
//                        }
//                    }
//                }
//            }
//        }
//        .navigationBarTitle("Template Gallery")
//        .navigationBarTitleDisplayMode(.inline)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarTrailing) {
//                HStack {
//                    Button(isEditing ? "Delete All" : "") {
//                        if isEditing {
//                            showingDeleteAlert = true
//                        }
//                    }
//                    Button(isEditing ? "Done" : "Edit") {
//                        isEditing.toggle()
//                    }
//                }
//            }
//        }
//        .alert(isPresented: $showingDeleteAlert) {
//            Alert(
//                title: Text("Delete All Badges"),
//                message: Text("Are you sure you want to delete all badges?"),
//                primaryButton: .destructive(Text("Delete"), action: {
//                    badgeModel.removeAll()
//                    isEditing = false
//                }),
//                secondaryButton: .cancel()
//            )
//        }
//    }
//
//}
//
//struct GridView_Previews: PreviewProvider {   static var previews: some View {
//    GridView().environmentObject(BadgeModel())
//        .previewDevice("iPad (8th generation)")
//}
//}
