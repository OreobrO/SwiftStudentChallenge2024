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
    @State private var instructionStarted = true
    
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
                    Text("please pick 3 to 4 items")
                        .font(Font.custom("Cinzel-Bold", size: 30))
                        .foregroundColor(.white)
                        .shadow(radius: 7, y: 10)
                    Text(badgeModel.firstSelectedBadges.map { $0.name }.joined(separator: ", "))
                        .font(Font.custom("Cinzel-Bold", size: 20))
                        .foregroundColor(.black)
                        .padding()
                        .padding(.horizontal, 32)
                        .background(
                            RoundedRectangle(cornerRadius: 50)
                                .fill(badgeModel.firstSelectedBadges.count > 0 ? Color.white : Color.clear)
                        )
                        .padding()
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(badgeModel.firstBadgeList, id: \.self) { item in
                                HStack {
                                    Image(systemName: badgeModel.firstSelectedBadges.contains(item) ? "checkmark.circle.fill" : "circle")
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
                                        .foregroundStyle(badgeModel.firstSelectedBadges.contains(item) ? .white.opacity(0.2) : Color.clear)
                                )
                                .frame(width: geo.size.width * 0.2)
                                .onTapGesture {
                                    if badgeModel.firstSelectedBadges.contains(item) {
                                        badgeModel.firstSelectedBadges.removeAll { $0 == item }
                                        badgeModel.selectedBadges.removeAll { $0 == item }
                                    } else {
                                        if badgeModel.firstSelectedBadges.count < 4 {
                                            badgeModel.firstSelectedBadges.append(item)
                                            badgeModel.selectedBadges.append(item)
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
                        Text("Pick 4 items")
                            .font(Font.custom("Cinzel-Bold", size: 30)).foregroundColor(.white)
                            .shadow(radius: 7, x: 0, y: 10)
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
                        .opacity(badgeModel.firstSelectedBadges.count < 3 ? 0.5 : 1.0)
                        .disabled(badgeModel.firstSelectedBadges.count < 3)
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Image("me")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                        Text("I've always wanted to be an Architect")
                            .font(Font.custom("Cinzel-Bold", size: 30)).foregroundColor(.white)
                            .shadow(radius: 7, x: 0, y: 10)
                        Spacer()
                    }
                    .opacity(instructionStarted ? 1 : 0)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.easeInOut(duration: 1)) {
                                instructionStarted = false
                            }
                        }
                    }
                }
            }
            .navigationTitle("First Question")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Warning"), message: Text("You can only select up to 4 items."), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct Question2View: View {
    @EnvironmentObject var badgeModel: BadgeModel
    @State private var showAlert = false
    @State private var instructionStarted = true

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
                    Text("please pick 4 items")
                        .font(Font.custom("Cinzel-Bold", size: 30))
                        .foregroundColor(.white)
                        .shadow(radius: 7, y: 10)
                    Text(badgeModel.secondSelectedBadges.map { $0.name }.joined(separator: ", "))
                        .font(Font.custom("Cinzel-Bold", size: 20))
                        .foregroundColor(.black)
                        .padding()
                        .padding(.horizontal, 32)
                        .background(
                            RoundedRectangle(cornerRadius: 50)
                                .fill(badgeModel.secondSelectedBadges.count > 0 ? Color.white : Color.clear)
                        )
                        .padding()
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(badgeModel.secondBadgeList, id: \.self) { item in
                                HStack {
                                    Image(systemName: badgeModel.secondSelectedBadges.contains(item) ? "checkmark.circle.fill" : "circle")
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
                                        .foregroundStyle(badgeModel.secondSelectedBadges.contains(item) ? .white.opacity(0.2) : Color.clear)
                                )
                                .frame(width: geo.size.width * 0.2)
                                .onTapGesture {
                                    if badgeModel.secondSelectedBadges.contains(item) {
                                        badgeModel.secondSelectedBadges.removeAll { $0 == item }
                                        badgeModel.selectedBadges.removeAll { $0 == item }
                                    } else {
                                        if badgeModel.secondSelectedBadges.count < 4 {
                                            badgeModel.secondSelectedBadges.append(item)
                                            badgeModel.selectedBadges.append(item)
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
                        Text("Pick 4 items")
                            .font(Font.custom("Cinzel-Bold", size: 30)).foregroundColor(.white)
                            .shadow(radius: 7, x: 0, y: 10)
                        NavigationLink(destination: Question3View()) {
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
                        .opacity(badgeModel.secondSelectedBadges.count < 3 ? 0.5 : 1.0)
                        .disabled(badgeModel.secondSelectedBadges.count < 3)
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Image("me")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                        Text("I really like running and swimming")
                            .font(Font.custom("Cinzel-Bold", size: 30)).foregroundColor(.white)
                            .shadow(radius: 7, x: 0, y: 10)
                        Spacer()
                    }
                    .opacity(instructionStarted ? 1 : 0)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.easeInOut(duration: 1)) {
                                instructionStarted = false
                            }
                        }
                    }
                }
            }
            .navigationTitle("Second Question")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Warning"), message: Text("You can only select up to 4 items."), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct Question3View: View {
    @EnvironmentObject var badgeModel: BadgeModel
    @State private var showAlert = false
    @State private var instructionStarted = true

    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(colors: [.black, Color(hex: 0x6B6B6B)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Text("What do you want to learn?")
                        .font(Font.custom("Cinzel-Bold", size: 60))
                        .foregroundColor(.white)
                        .shadow(radius: 7, y: 10)
                    Text("please pick 4 items")
                        .font(Font.custom("Cinzel-Bold", size: 30))
                        .foregroundColor(.white)
                        .shadow(radius: 7, y: 10)
                    Text(badgeModel.thirdSelectedBadges.map { $0.name }.joined(separator: ", "))
                        .font(Font.custom("Cinzel-Bold", size: 20))
                        .foregroundColor(.black)
                        .padding()
                        .padding(.horizontal, 32)
                        .background(
                            RoundedRectangle(cornerRadius: 50)
                                .fill(badgeModel.thirdSelectedBadges.count > 0 ? Color.white : Color.clear)
                        )
                        .padding()
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(badgeModel.thirdBadgeList, id: \.self) { item in
                                HStack {
                                    Image(systemName: badgeModel.thirdSelectedBadges.contains(item) ? "checkmark.circle.fill" : "circle")
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
                                        .foregroundStyle(badgeModel.thirdSelectedBadges.contains(item) ? .white.opacity(0.2) : Color.clear)
                                )
                                .frame(width: geo.size.width * 0.2)
                                .onTapGesture {
                                    if badgeModel.thirdSelectedBadges.contains(item) {
                                        badgeModel.thirdSelectedBadges.removeAll { $0 == item }
                                        badgeModel.selectedBadges.removeAll { $0 == item }
                                    } else {
                                        if badgeModel.thirdSelectedBadges.count < 4 {
                                            badgeModel.thirdSelectedBadges.append(item)
                                            badgeModel.selectedBadges.append(item)
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
                        Text("Pick 4 items")
                            .font(Font.custom("Cinzel-Bold", size: 30)).foregroundColor(.white)
                            .shadow(radius: 7, x: 0, y: 10)
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
                        .opacity(badgeModel.thirdSelectedBadges.count < 3 ? 0.5 : 1.0)
                        .disabled(badgeModel.thirdSelectedBadges.count < 3)
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Image("me")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200)
                        Text("I would like to learn everything about Swift")
                            .font(Font.custom("Cinzel-Bold", size: 30)).foregroundColor(.white)
                            .shadow(radius: 7, x: 0, y: 10)
                        Spacer()
                    }
                    .opacity(instructionStarted ? 1 : 0)
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            withAnimation(.easeInOut(duration: 1)) {
                                instructionStarted = false
                            }
                        }
                    }
                }
            }
            .navigationTitle("Third Question")
            .alert(isPresented: $showAlert) {
                Alert(title: Text("Warning"), message: Text("You can only select up to 4 items."), dismissButton: .default(Text("OK")))
            }
        }
    }
}


#Preview {
    QuestionView()
}

