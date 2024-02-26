//
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
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, Color(hex: 0xD9D9D9)], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                ScrollView {
                    LazyVGrid(columns: gridColumns) {
                        ForEach(badgeModel.selectedBadges) { badge in
                            GeometryReader { geo in
                                GridItemView(badge: badge, isEditing: $isEditing, isDrawEditing: $isDrawEditing)
                                    .environmentObject(badgeModel)
                            }
                            .cornerRadius(8.0)
                            .aspectRatio(1, contentMode: .fit)
                            .shadow(color: Color(red: 0.8, green: 0.8, blue: 0.8, opacity: 0.5), radius: 8)
                            .padding()
                        }
                    }
                    .padding()
                }
            }
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        isDrawEditing.toggle()
                    } label: {
                        if isDrawEditing {
                            Text("Done")
                                .foregroundStyle(.gray)
                                .bold()
                                .font(.system(size: 24))
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 100)
                                        .foregroundStyle(Color.white)
                                        .shadow(color: .gray, radius: 8, x: 0, y: 4)
                                }
                                .padding(32)
                        } else {
                            Image(systemName: "pencil")
                                .foregroundStyle(.gray)
                                .bold()
                                .font(.system(size: 24))
                                .padding()
                                .background {
                                    RoundedRectangle(cornerRadius: 100)
                                        .foregroundStyle(Color.white)
                                        .shadow(color: .gray, radius: 8, x: 0, y: 4)
                                }
                                .padding(32)
                        }
                    }
                }
            }
        }
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

struct GridView_Previews: PreviewProvider {   static var previews: some View {
    GridView().environmentObject(BadgeModel())
        .previewDevice("iPad (8th generation)")
}
}
