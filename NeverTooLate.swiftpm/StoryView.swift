//
//  StoryView.swift
//  NeverTooLate
//
//  Created by 최민규 on 2/25/24.
//

import SwiftUI


struct StoryView: View {
    @EnvironmentObject var badgeModel: BadgeModel
    @State private var storyIndex = 0
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                HStack {
                    Image(String(storyIndex))
                        .resizable()
                        .scaledToFit()
                        .frame(width: 600, height: 600)
                        .padding()
                    Text(storyText(index: storyIndex))
                        .font(Font.custom("Cinzel-Bold", size: 30))
                        .foregroundColor(.white)
                        .offset(x: [0, 3, 4].contains(storyIndex) ? -100 : 0)
                }
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        if storyIndex > 0 {
                            Text("Back")
                                .bold()
                                .foregroundColor(.black)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 100)
                                        .fill(Color.white.opacity(0.7))
                                        .shadow(color: .gray, radius: 8, x: 0, y: 4)
                                )
                                .padding(32)
                                .offset(x: 32)
                                .onTapGesture {
                                    if storyIndex > 0 {
                                        storyIndex -= 1
                                    }
                                }
                        }
                        if storyIndex == 4 {
                            NavigationLink(destination: QuestionView().environmentObject(badgeModel)) {
                                Text("Let's Go!")
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
                        } else {
                            Text("NEXT")
                                .bold()
                                .foregroundColor(.black)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 100)
                                        .fill(Color.white)
                                        .shadow(color: .gray, radius: 8, x: 0, y: 4)
                                )
                                .padding(32)
                                .onTapGesture {
                                    if storyIndex < 4 {
                                        storyIndex += 1
                                    }
                                }
                        }
                    }
                }
            }
        }
        .background(
            LinearGradient(colors: [.black, Color(hex: 0x6B6B6B)], startPoint: .top, endPoint: .bottom)
        )
    }
}

func storyText(index: Int) -> String {
    switch index {
        case 0: return String("Hey, I'm Min-Gyu from South Korea. Would you like to hear my story?")
        case 1: return String("I majored in architecture and designed some amazing buildings.\n\nIt feels like that's how I spent my twenties.")
        case 2: return String("However, I wanted to inspire people not only with hardware but also with software.\n\nSo, I joined the Apple Developer Academy at 30.")
        case 3: return String("Can I share my secret to always taking on challenges?\n\nMy secret is the spirit of exploration, \nfinding what I want to do regardless of age.")
        case 4: return String("Shall we embark on finding your dreams together now?\n\nIt's never too late to start.")
        default: return String("")
    }
}
#Preview {
    StoryView()
}
