//
//  Home.swift
//  Learnathon
//
//  Created by Jonathan Gaytan on 5/14/20.
//  Copyright © 2020 Jonathan Gaytan. All rights reserved.
//
//#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
import SwiftUI

struct Home: View {
    @State var showProfile = false
    @State var viewState = CGSize.zero
    @State var showContent = false
    @State var showQuiz = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            
            HomeView(showProfile: $showProfile, showContent: $showContent, showQuiz: $showQuiz)
                .padding(.top, 44)
                .background(
                    VStack {
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1)), Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1))]), startPoint: .top, endPoint: .bottom)
                            .frame(height: 200)
                        Spacer()
                    }
                    .background(Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1)))
                )
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
                .offset(y: showProfile ? -450 : 0)
                .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10.0, y: 0, z: 0))
                .scaleEffect(showProfile ? 0.9 : 1)
                .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : screen.height)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showProfile.toggle()
            }
            .gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                }
                .onEnded { value in
                    if self.viewState.height > 50 {
                        self.showProfile = false
                    }
                    self.viewState = .zero
                }
            )
            
            if showContent {
                Color.white.edgesIgnoringSafeArea(.all)
                
                ContentView()
                
                VStack {
                    HStack {
                        Spacer()
                        
                        Image(systemName: "xmark")
                        .frame(width: 36, height: 36)
                        .foregroundColor(.white)
                        .background(Color.black)
                            .clipShape(Circle())
                    }
                    Spacer()
                }
                .offset(x: -16, y: 16)
                .transition(.move(edge: .top))
                .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
                .onTapGesture {
                    self.showContent = false
                }
            }
            
            if showQuiz{
                
                ZStack {
                    Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1))
                        .offset(y: 100)
                    QuizView(quiz: Quiz(question: "Which of the following is not a data type in Python?", image: Image(uiImage:#imageLiteral(resourceName: "section1_q1")), answerChoices: ["Float","Integer","Boolean","Double"], correctIndex: 3), showQuiz: $showQuiz)
                }
                .transition(.move(edge: .bottom))
                .animation(.spring(response: 0.6, dampingFraction: 0.8, blendDuration: 0))
            }
            
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

struct AvatarView: View {
    @Binding var showProfile: Bool
    
    var body: some View {
        Button(action: { self.showProfile.toggle() }) {
            Image("Profile_Picture")
                .renderingMode(.original)
                .resizable()
                .frame(width: 36, height: 36)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 1))
        }
    }
}

let screen = UIScreen.main.bounds
