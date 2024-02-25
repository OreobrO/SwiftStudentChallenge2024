//
//  StoryView.swift
//  NeverTooLate
//
//  Created by 최민규 on 2/25/24.
//

import SwiftUI


struct StoryView: View {
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
                            NavigationLink(destination: QuestionView()) {
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
    case 0: return String("안녕, 나는 한국에서 온 민규야, 내 이야기를 들어볼래?")
    case 1: return String("나는 건축을 전공했어, 멋진 건물을 만들었지\n20대를 이렇게 보냈던 것 같아")
    case 2: return String("하드웨어뿐 아니라 소프트웨어로\n사람들에게 감동을 주는 사람이 되고싶었어\n그래서 30에 애플아카데미에 가게 되었지")
    case 3: return String("비결을 알려줘?\n내 비결은 나이와 관계없이 하고싶은 것들을\n찾아나가는  도전정신이야.")
    case 4: return String("그럼 이제 나와 함께\n너의 꿈을 찾아가볼까?\n지금이라도 늦지 않았어~")
    default: return String("")
    }
}
#Preview {
    StoryView()
}
