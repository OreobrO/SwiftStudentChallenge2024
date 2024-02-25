//
//  QuestionView.swift
//  NeverTooLate
//
//  Created by 최민규 on 2/25/24.
//

import SwiftUI

struct QuestionView: View {
    let childhoodDreamJobs = [
        "Astronaut",
        "Firefighter",
        "Doctor",
        "Teacher",
        "Police Officer",
        "Actor/Actress",
        "Professional Athlete",
        "Artist",
        "Veterinarian",
        "Chef",
        "Scientist",
        "Pilot",
        "Dancer",
        "Engineer",
        "Singer",
        "Writer",
        "Architect",
        "Nurse",
        "Superhero",
        "Explorer",
        "Paleontologist",
        "Fashion Designer",
        "Photographer",
        "Journalist",
        "Musician",
        "Computer Programmer",
        "Magician",
        "Zookeeper",
        "Race Car Driver",
        "Fashion Model"
    ]
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(colors: [.black, Color(hex: 0x6B6B6B)], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Text("What was your childhood dream")
                        .font(Font.custom("Cinzel-Bold", size: 60)).foregroundColor(.white)
                        .shadow(radius: 7, y: 10)
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 32) {
                            ForEach(childhoodDreamJobs, id: \.self) { item in
                                Text(item)
                                    .font(Font.custom("Cinzel-Bold", size: 24))
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: geo.size.width * 0.2)
                                    .background(
                                        Color.white.opacity(0.3)
                                    )
                            }
                        }
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink(destination: QuestionView()) {
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
            }.navigationTitle("First Question")
        }
    }
}

#Preview {
    QuestionView()
}
