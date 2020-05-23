//
//  QuizView.swift
//  Learnathon
//
//  Created by Jonathan Gaytan on 5/23/20.
//  Copyright © 2020 Jonathan Gaytan. All rights reserved.
//

import SwiftUI

struct QuizView: View {
    var body: some View {
        //Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        ZStack {
            Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 15){
                Text("Which of the following is not a data type in Python?")
                    .foregroundColor(Color.white)
                    .font(.system(size: 28, weight: .semibold))
                    .frame(maxWidth: .infinity)
                    .frame(height: 200)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal,50)

                Spacer()
                HStack {
                    Text("Float")
                        .foregroundColor(Color.white)
                }
                .frame(width: 350, height: 60, alignment: .center)
                .background(Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1)))
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                
                HStack {
                    Text("Integer")
                        .foregroundColor(Color.white)
                }
                .frame(width: 350, height: 60, alignment: .center)
                .background(Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1)))
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                
                HStack {
                    Text("Boolean")
                        .foregroundColor(Color.white)
                }
                .frame(width: 350, height: 60, alignment: .center)
                .background(Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1)))
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                
                HStack {
                    Text("Double")
                        .foregroundColor(Color.white)
                }
                .frame(width: 350, height: 60, alignment: .center)
                .background(Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1)))
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                HStack {
                    Text("Submit")
                        .foregroundColor(Color.white)
                    Image(systemName: "chevron.up.circle")
                        .foregroundColor(Color.white)
                        .font(.system(size: 25, weight: .regular))
                        //.offset(x: 100)
                    
                }
                .frame(width: 350, height: 60, alignment: .center)
                .background(Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)))
                .cornerRadius(10)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
            }
        }
    }
}

struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
    }
}
