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
    @State private var isAddingBadge = false
    @State private var isEditing = false
    @State private var showingDeleteAlert = false
    
    @State private var gridColumns = Array(repeating: GridItem(.flexible()), count: columns)
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: gridColumns) {
                    ForEach(badgeModel.badges) { badge in
                        GeometryReader { geo in
                            GridItemView(badge: badge)
                        }
                        .cornerRadius(8.0)
                        .aspectRatio(1, contentMode: .fit)
                        .shadow(color: Color(red: 0.8, green: 0.8, blue: 0.8, opacity: 0.5), radius: 8)
                        .padding()
                        .overlay(alignment: .topTrailing) {
                            if isEditing {
                                Button {
                                    withAnimation {
                                        badgeModel.removeBadge(badge)
                                    }
                                } label: {
                                    Image(systemName: "xmark.square.fill")
                                        .font(Font.title)
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(.white, .red)
                                }
                                .offset(x: 2, y: 0)
                            }
                        }
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle("Template Gallery")
        .navigationBarTitleDisplayMode(.inline)
        .sheet(isPresented: $isAddingBadge) {
            BadgePickerView(isPresented: $isAddingBadge).environmentObject(badgeModel)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(isEditing ? "Done" : "Edit") {
                    isEditing.toggle()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    if isEditing {
                        showingDeleteAlert = true
                    } else {
                        isAddingBadge = true
                    }
                } label: {
                    if isEditing {
                        Text("Delete all")
                            .foregroundStyle(.red)
                    } else {
                        Image(systemName: "plus")
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
                secondaryButton: .cancel {
                    isEditing = false
                }
            )
        }
    }
}

struct GridView_Previews: PreviewProvider {   static var previews: some View {
    GridView().environmentObject(BadgeModel())
        .previewDevice("iPad (8th generation)")
}
}
