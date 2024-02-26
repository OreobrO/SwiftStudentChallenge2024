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
        .navigationBarTitle("Template Gallery")
        .navigationBarTitleDisplayMode(.inline)
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
                        isDrawEditing = true
                    }
                } label: {
                    if isEditing {
                        Text("Delete all")
                            .foregroundStyle(.red)
                    } else {
                        Image(systemName: "pencil")
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
