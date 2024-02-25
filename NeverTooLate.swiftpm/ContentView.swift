//
//  ContentView.swift
//  NeverTooLate
//
//  Created by 최민규 on 2/25/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var radiusToggle: Bool = false
    @State private var shadowToggle: Bool = false
    @State private var buttonShadowToggle: Bool = false
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    Rectangle()
                        .fill(RadialGradient(
                            gradient: Gradient(colors: [.white, Color(hex: 0xABABAB)]),
                            center: .top,
                            startRadius: radiusToggle ? 500 : 300,
                            endRadius: radiusToggle ? 1800 : 900))
                        .edgesIgnoringSafeArea(.all)
                        .onAppear() {
                            withAnimation(.easeInOut(duration: 2)) {
                                radiusToggle = true
                            }
                        }
                    
                    Image("main")
                        .resizable()
                        .scaledToFit()
                    
                    VStack {
                        Text("NEVER TOO LATE")
                            .font(Font.custom("Cinzel-Bold", size: 100)).foregroundColor(.black)
                            .shadow(radius: shadowToggle ? 7 : 0, x: 0, y: shadowToggle ? 10 : 0)
                            .onAppear() {
                                withAnimation(.easeInOut(duration: 2)) {
                                    shadowToggle = true
                                }
                            }
                        Spacer()
                        
                        NavigationLink(destination: Story1View()) {
                            Text("Start Dreaming")
                                .bold()
                                .foregroundColor(.black)
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 100)
                                        .fill(Color.white)
                                        .shadow(color: .gray, radius: buttonShadowToggle ? 8 : 4, x: 0, y: 4)
                                )
                                .scaleEffect(buttonShadowToggle ? 1.02 : 1)
                                .onAppear {
                                    withAnimation(.easeInOut(duration: 0.8).repeatForever()) {
                                        buttonShadowToggle.toggle()
                                    }
                                }
                        }
                    }
                    .frame(height: geo.size.height * 0.8)
                    .offset(y: -50)

                }
            }
        }
    }
}

struct Story1View: View {
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Rectangle()
                    .fill(RadialGradient(
                        gradient: Gradient(colors: [.white, Color(hex: 0xABABAB)]),
                        center: .top,
                        startRadius: 500,
                        endRadius: 1800))
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    NavigationLink(destination: Story2View()) {
                        Text("Start Dreaming")
                            .bold()
                            .foregroundColor(.black)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 100)
                                    .fill(Color.white)
                                    .shadow(color: .gray, radius: 8, x: 0, y: 4)
                            )
                    }
                    .offset(y: -50)
                }
            }
            .navigationTitle("Story 1")
        }
    }
}

struct Story2View: View {
    var body: some View {
        VStack {
            Text("This is Story 2")
                .padding()
            
            NavigationLink(destination: Question1View()) {
                Text("Continue to Question 1")
                    .padding()
            }
        }
        .navigationTitle("Story 2")
    }
}

struct Question1View: View {
    var body: some View {
        VStack {
            Text("This is Question 1")
                .padding()
            
            NavigationLink(destination: Question2View()) {
                Text("Continue to Question 2")
                    .padding()
            }
        }
        .navigationTitle("Question 1")
    }
}

struct Question2View: View {
    var body: some View {
        Text("This is Question 2")
            .padding()
            .navigationTitle("Question 2")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


#Preview {
    ContentView()
}
