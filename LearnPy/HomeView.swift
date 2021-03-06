//
//  HomeView.swift
//  Learnathon
//
//  Created by Jonathan Gaytan on 5/14/20.
//  Copyright © 2020 Jonathan Gaytan. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @Binding var showProfile: Bool
    @State var showUpdate = false
    @Binding var showContent: Bool
    @State var activeIndex = 0
    @Binding var showQuiz: Bool
    
    var body: some View {
        ScrollView {
            VStack {
                HStack(spacing: 12) {
                    Text("LearnPy")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        //.modifier(CustomFontModifier(size: 28))
                    
                    Spacer()
                    
                    AvatarView(showProfile: $showProfile)
                    
                    Button(action: { self.showUpdate.toggle() }) {
                        Image(systemName: "bell")
                            .renderingMode(.original)
                            .font(.system(size: 16, weight: .medium))
                            .frame(width: 36, height: 36)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    }
//                    .sheet(isPresented: $showUpdate) {
////                        UpdateList()
//                    }
                }
                .padding(.horizontal)
                .padding(.leading, 14)
                .padding(.top, 30)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    SectionsList(activeIndex: self.$activeIndex)
                        .padding(.horizontal, 30)
                        .padding(.bottom, 30)
                        .padding(.top, 15)
//                        .onTapGesture {
//                            self.showContent = true
//                    }
                }
                
                HStack {
                    Text("Lessons")
                        .font(.title).bold()
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        
                    Spacer()
                }
                .padding(.leading, 30)
                //.offset(y: -60)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {

                        ForEach(Sections[activeIndex].LessonData) { item in
                            
                            
                            GeometryReader { geometry in
                                SectionView(section: item)
                                    .rotation3DEffect(Angle(degrees:
                                        Double(geometry.frame(in: .global).minX - 30) / -20
                                    ), axis: (x: 0, y: 10, z: 0))
                            }
                            .frame(width: 250, height: 250)
                        }
                    }
                    .padding(30)
                    .padding(.bottom, 30)
                }
                .offset(y: -30)
                
                HStack {
                    Text("Knowledge Check")
                        .font(.title).bold()
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(y: -60)
                
//                SectionView(section: sectionData[2], width: screen.width - 60, height: 275)
//                .offset(y: -60)
                ScrollView(.horizontal, showsIndicators: false) {
                   HStack(spacing: 20) {
                       ForEach(Sections[activeIndex].KnowledgeData) { item in
                           GeometryReader { geometry in
                               SectionView(section: item)
                                   .rotation3DEffect(Angle(degrees:
                                       Double(geometry.frame(in: .global).minX - 30) / -20
                                   ), axis: (x: 0, y: 10, z: 0))
                            }
                           .frame(width: 250, height: 250)
                            .onTapGesture {
                                self.showQuiz = true
                            }
                       }
                   }
                   .padding(30)
                   .padding(.bottom, 30)
               }
               .offset(y: -90)
                
                HStack {
                    Text("Progress")
                        .font(.title).bold()
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        
                    Spacer()
                }
                .padding(.leading, 30)
                .offset(y: -120)
                
                RingView(color1: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), color2: #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1), width: 200, height: 200, percent: Sections[activeIndex].progress, show: .constant(true))
                    .offset(y:-60)
                
                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            HomeView(showProfile: .constant(false), showContent: .constant(false), showQuiz: .constant(false))
//            SectionsListElement(section: Sections[0])
        }
    }
}

struct SectionView: View {
    var section: Section
    var width: CGFloat = 250
    var height: CGFloat = 250
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(section.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(.white)
                Spacer()
                Image(section.logo)
            }
            
            Text(section.text.uppercased())
                .font(.system(.body, design: .rounded))
                .opacity(0.3)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
            section.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 210,height:130)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: width, height: height)
        .background(section.color)
        .cornerRadius(30)
        .shadow(color: section.color.opacity(0.3), radius: 15, x: 0, y: 20)
    }
}

struct Section: Identifiable {
    var id = UUID()
    var title: String
    var text: String
    var logo: String
    var image: Image
    var color: Color
}

let section1Data1 = [
    Section(title: "Why Learn Python?", text: "Incomplete", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "section1_1")), color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))),
    Section(title: "Printing to the Consol", text: "Incomplete", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "section1_2")), color: Color(#colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))),
    Section(title: "Expressions", text: "Incomplete", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "section1_3")), color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)))
]

let section1Data2 = [
    Section(title: "Printing Challenge", text: "Incomplete", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "section1_q1")), color: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))),
    Section(title: "Physics Problem", text: "Incomplete", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "section1_q2")), color: Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))),
    Section(title: "Section Quiz", text: "Incomplete", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "section1_q3")), color: Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
]

let section2Data1 = [
    Section(title: "Integers", text: "Incomplete", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "section1_1")), color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))),
    Section(title: "Floating Point & Error", text: "Incomplete", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "JAG_LOGO")), color: Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))),
    Section(title: "Character", text: "Incomplete", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Image1")), color: Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
]

let section2Data2 = [
    Section(title: "Printing Challenge", text: "Incomplete", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "section1_q1")), color: Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))),
    Section(title: "Physics Problem", text: "Incomplete", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "JAG_LOGO")), color: Color(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1))),
    Section(title: "Section Quiz", text: "Incomplete", logo: "Logo1", image: Image(uiImage: #imageLiteral(resourceName: "Image1")), color: Color(#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)))
]



struct SectionsList: View {
    @State var sections = Sections
    @Binding var activeIndex: Int
    var body: some View {
        HStack(spacing: 20) {
            ForEach(sections.indices, id: \.self) { index in
                HStack(spacing: 12.0) {
                    
                    SectionsListElement(
                        section: self.sections[index],
                        active: self.$sections[index].active,
                        index:index,
                        activeIndex: self.$activeIndex)
                    
                }
                //.frame(width:125,height: 20)
//                .padding(8)
//                .padding(.leading,4)
                //.background(section.active ? Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)):Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1)))
//                .cornerRadius(10)
//                .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 0.0)
                //.modifier(ShadowModifier())

                
            }
            
        }
    }
}

struct SectionsListElement: View {
    var section:SectionInfo
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int

    var body: some View {
        VStack( spacing: 4.0) {
//            Text("Section \(section.number)")
//                .bold()
//                .modifier(FontModifier(style: .subheadline))
            Text("\(section.name)")
                .bold()
                .modifier(FontModifier(style: .subheadline))
        }
        .padding(8)
        .padding(.leading,4)
        .foregroundColor(Color.white)
        .modifier(FontModifier())
        .background(self.index == self.activeIndex ? Color(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)):Color(#colorLiteral(red: 0.1411764706, green: 0.2039215686, blue: 0.2784313725, alpha: 1)))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 8, x: 0, y: 0.0)
        .onTapGesture {
            self.activeIndex = self.index
        }
        .animation(.none)
    }
}


struct SectionInfo:Identifiable{
    var id = UUID()
    var number:Int
    var name:String
    var LessonData:[Section]
    var KnowledgeData:[Section]
    var active = false
    var progress:CGFloat
}

let Sections = [
    SectionInfo(number: 1, name: "Fundamentals",
                LessonData: section1Data1, KnowledgeData: section1Data2, active: true, progress: 23),
    SectionInfo(number: 2, name: "Data Types",
                LessonData: section2Data1,KnowledgeData: section2Data2, active: false, progress: 15),
    SectionInfo(number: 3, name: "Conditionals",
                LessonData: section1Data1,KnowledgeData: section1Data2, active: false, progress: 35),
    SectionInfo(number: 4, name: "Lists",
                LessonData: section2Data1,KnowledgeData: section2Data2, active: false, progress: 100)
]
