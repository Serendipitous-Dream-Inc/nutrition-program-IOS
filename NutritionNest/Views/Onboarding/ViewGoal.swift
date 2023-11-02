//
//  ViewGoal.swift
//  NutritionNest
//
//  Created by Oliver on 2023/10/31.
//

import SwiftUI

struct ViewGoal: View {
    @State private var commentText = ""
    @State private var selectedGoal: String?

    var body: some View {
        VStack {
            HStack(spacing: -20) {
                Button {
                    
                }label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 30))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 40))
                        .foregroundColor(.black
                        )

                }
                HStack(spacing: 8) {
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 55, height: 8)
                        .foregroundColor(.black)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 55, height: 8)
                        .foregroundColor(.gray)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 55, height: 8)
                        .foregroundColor(.gray)
                        .cornerRadius(4)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 55, height: 8)
                        .foregroundColor(.gray)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 55, height: 8)
                        .foregroundColor(.gray)
                }
            }.padding(.top, 30)

            Text("My goals are...").font(.custom("Inter", size: 30)).padding()
            Text("You may select multiple options").font(.custom("Inter", size: 18)).foregroundColor(.gray)
                .padding(.top, -10)
                
            Button {
                if selectedGoal == "Maintain weight" {
                    selectedGoal = nil
                } else {
                    selectedGoal = "Maintain weight"
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedGoal == "Maintain weight" ? Color.blue : Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    
                    Text("Maintain weight")
                        .font(.custom("Inter", size: 18))
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedGoal == "Maintain weight" ? .white : .black)
                }
            }.padding(.top, 30)

            Button {
                if selectedGoal == "Gain weight" {
                    selectedGoal = nil
                } else {
                    selectedGoal = "Gain weight"
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedGoal == "Gain weight" ? Color.blue : Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    
                    Text("Gain weight")
                        .font(.custom("Inter", size: 18))
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedGoal == "Gain weight" ? .white : .black)
                }
            }.padding(.top, 20)

            Button {
                if selectedGoal == "Lose weight" {
                    selectedGoal = nil
                } else {
                    selectedGoal = "Lose weight"
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedGoal == "Lose weight" ? Color.blue : Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    
                    Text("Lose weight")
                        .font(.custom("Inter", size: 18))
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedGoal == "Lose weight" ? .white : .black)
                }
            }.padding(.top, 20)
            ZStack {

                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 250, height: 120)

                    Text("Comment")
                        .font(.custom("Inter", size: 18))
                        .foregroundColor(.black)
                        .offset(x: 20, y: 20)
                }
                ZStack(alignment: .bottom) {
                    TextField("Ex: Improve upper body", text: $commentText)
                        .textFieldStyle(PlainTextFieldStyle()).frame(width: 200, height: 70)
                        .padding(.top, 50 ).font(.custom("Inter", size: 13)).offset(x: -5, y: -25)
                    Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray)
                            .padding(EdgeInsets(top: -52, leading: 93, bottom: 0, trailing: 85))
                }
            }.padding(.top, 20)

            Button {

            } label: {

                Text("Next")
                    .font(.custom("Inter", size: 25)).bold()
                    .padding(EdgeInsets(top: 20, leading: 140, bottom: 20, trailing: 140))
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.top, 50)
                    
            }.padding(.top, 35)
            Button {

            } label: {

                Text("Skip")
                    .font(.custom("Inter", size: 18)).bold()
                    .padding(.top, 25)
                    
            }

        }
        .padding()
    }
}
struct ViewGoal_Previews: PreviewProvider {
    static var previews: some View {
        ViewGoal()
    }
}
