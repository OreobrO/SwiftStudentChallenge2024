//
//  QuestionView.swift
//  NeverTooLate
//
//  Created by 최민규 on 2/25/24.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var badgeModel: BadgeModel
    @State private var showAlert = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(colors: [.black, Color(hex: 0x6B6B6B)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Text("What was your childhood dream?")
                        .font(Font.custom("Cinzel-Bold", size: 60))
                        .foregroundColor(.white)
                        .shadow(radius: 7, y: 10)
                    Text(badgeModel.firstSelectedItems.map { $0.name }.joined(separator: ", "))
                        .font(Font.custom("Cinzel-Bold", size: 20))
                        .foregroundColor(.black)
                        .padding()
                        .padding(.horizontal, 32)
                        .background(
                            RoundedRectangle(cornerRadius: 50)
                                .fill(badgeModel.firstSelectedItems.count > 0 ? Color.white : Color.clear)
                        )
                        .padding()
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(badgeModel.firstBadgeList, id: \.self) { item in
                                HStack {
                                    Image(systemName: badgeModel.firstSelectedItems.contains(item) ? "checkmark.circle.fill" : "circle")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .padding(.leading, 4)
                                    Image(systemName: item.symbol)
                                        .font(.title2)
                                        .foregroundColor(.white)
                                    Text(item.name)
                                        .font(Font.custom("Cinzel-Bold", size: 24))
                                        .foregroundColor(.white)
                                        .padding(8)
                                    Spacer()
                                }
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(badgeModel.firstSelectedItems.contains(item) ? .white.opacity(0.2) : Color.clear)
                                )
                                .frame(width: geo.size.width * 0.2)
                                .onTapGesture {
                                    if badgeModel.firstSelectedItems.contains(item) {
                                        badgeModel.firstSelectedItems.removeAll { $0 == item }
                                    } else {
                                        if badgeModel.firstSelectedItems.count < 3 {
                                            badgeModel.firstSelectedItems.append(item)
                                        } else {
                                            showAlert = true
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: Question2View().environmentObject(badgeModel)) {
                            Text("Next")
                                .bold()
                                .foregroundColor(.black)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 100)
                                        .fill(Color.white)
                                        .shadow(color: .gray, radius: 8, x: 0, y: 4)
                                )
                                .padding(32)
                        }
                    }
                }
            }
            .navigationTitle("First Question")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Warning"), message: Text("You can only select up to 3 items."), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct Question2View: View {
    @EnvironmentObject var badgeModel: BadgeModel
    @State private var showAlert = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(colors: [.black, Color(hex: 0x6B6B6B)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Text("What Interests you the most?")
                        .font(Font.custom("Cinzel-Bold", size: 60))
                        .foregroundColor(.white)
                        .shadow(radius: 7, y: 10)
                    Text(badgeModel.secondSelectedItems.map { $0.name }.joined(separator: ", "))
                        .font(Font.custom("Cinzel-Bold", size: 20))
                        .foregroundColor(.black)
                        .padding()
                        .padding(.horizontal, 32)
                        .background(
                            RoundedRectangle(cornerRadius: 50)
                                .fill(badgeModel.secondSelectedItems.count > 0 ? Color.white : Color.clear)
                        )
                        .padding()
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(badgeModel.secondBadgeList, id: \.self) { item in
                                HStack {
                                    Image(systemName: badgeModel.secondSelectedItems.contains(item) ? "checkmark.circle.fill" : "circle")
                                        .font(.title2)
                                        .foregroundColor(.white)
                                        .padding(.leading, 4)
                                    Image(systemName: item.symbol)
                                        .font(.title2)
                                        .foregroundColor(.white)
                                    Text(item.name)
                                        .font(Font.custom("Cinzel-Bold", size: 24))
                                        .foregroundColor(.white)
                                        .padding(8)
                                    Spacer()
                                }
                                .background(
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundStyle(badgeModel.secondSelectedItems.contains(item) ? .white.opacity(0.2) : Color.clear)
                                )
                                .frame(width: geo.size.width * 0.2)
                                .onTapGesture {
                                    if badgeModel.secondSelectedItems.contains(item) {
                                        badgeModel.secondSelectedItems.removeAll { $0 == item }
                                    } else {
                                        if badgeModel.secondSelectedItems.count < 3 {
                                            badgeModel.secondSelectedItems.append(item)
                                        } else {
                                            showAlert = true
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: GridView()) {
                            Text("Next")
                                .bold()
                                .foregroundColor(.black)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 100)
                                        .fill(Color.white)
                                        .shadow(color: .gray, radius: 8, x: 0, y: 4)
                                )
                                .padding(32)
                        }
                    }
                }
            }
            .navigationTitle("Second Question")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Warning"), message: Text("You can only select up to 3 items."), dismissButton: .default(Text("OK")))
            }
        }
    }
}


#Preview {
    QuestionView()
}

