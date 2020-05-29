////
//  QuizView.swift
//  Learnathon
//
//  Created by Jonathan Gaytan on 5/23/20.
//  Copyright © 2020 Jonathan Gaytan. All rights reserved.
//
import SwiftUI

struct QuizView: View {
    var quiz:Quiz
    @State var activeIndex = -1
    
    @Binding var showQuiz: Bool
    
    var body: some View {
        ScrollView {
            ZStack {
                
//                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1)), Color(#colorLiteral(red: 0.1020417781, green: 0.1484055788, blue: 0.2053428573, alpha: 1))]), startPoint: .topLeading, endPoint: .bottomTrailing)
//                    .edgesIgnoringSafeArea(.all)
                
                Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1))
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 15){
                    HStack{
                        Spacer()
                        Image(systemName: "xmark")
                            .renderingMode(.original)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                            //.transition(.move(edge: .top))
    //                        .animation(.easeOut)
                            .onTapGesture {
                                self.showQuiz = false
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.leading, 14)
                    .padding(.top, 30)
                    
                    Text("\(quiz.question)")
                        .foregroundColor(Color.white)
                        .font(.system(size: 28, weight: .semibold))
                        .frame(maxWidth: .infinity)
                        .frame(height: 150)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal,50)
                    quiz.image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(10)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal,20)
                        .frame(height: 200)
                        .offset(y: -15)
                        
                    Spacer()
                    
                    ForEach(quiz.answerChoices.indices, id: \.self) { index in
                        QuizOption(name: "\(self.quiz.answerChoices[index])",index: index, activeIndex: self.$activeIndex)
                    }
                    
                    HStack {
                        Text("Submit")
                            .foregroundColor(Color.white)
                            .offset(x: 17)
                        Image(systemName: "chevron.up.circle")
                            .foregroundColor(Color.white)
                            .font(.system(size: 25, weight: .regular))
                            .offset(x: 100)
                        
                    }
                    .frame(width: 350, height: 60, alignment: .center)
                    .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    .offset(y: -30)
                    Spacer()
                }
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            QuizView(quiz: Quiz(question: "Which of the following is not a data type in Python?", image: Image(uiImage:#imageLiteral(resourceName: "section1_q1")), answerChoices: ["Float","Integer","Boolean","Double"], correctIndex: 3), showQuiz: .constant(false))
        }
    }
}


struct Quiz{
    var question:String
    var image:Image
    var answerChoices:[String]
    var correctIndex:Int
}



struct QuizOption: View {
    var name:String
    var index:Int
    
    @Binding var activeIndex: Int
    
    var body: some View {
        HStack {
            Text("\(name)")
                .foregroundColor(Color.white)
        }
        .frame(width: 350, height: 60, alignment: .center)
        .background(self.index == self.activeIndex ? Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)):Color(#colorLiteral(red: 0.16355742, green: 0.2378715271, blue: 0.3291333078, alpha: 1)))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
        .offset(y: -30)
        .onTapGesture {
            self.activeIndex = self.index
        }
    }
}
