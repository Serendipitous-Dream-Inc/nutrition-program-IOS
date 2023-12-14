//
//  ViewGender.swift
//  NutritionNest
//
//  Created by Oliver on 2023/10/31.
//

import SwiftUI

struct ViewGender: View {
    @State private var selectedGender: String?
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

            Text(Localization.ViewGender.iam).font(CustomFonts.inter.font(size: 26)).padding()
            Button {
                if selectedGender == "Male" {
                    selectedGender = nil
                } else {
                    selectedGender = "Male"
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedGender == "Male" ? Color.blue : Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    
                    Text(Localization.ViewGender.male).font(CustomFonts.inter.font(size: 18)).frame(width: 250, height: 85)
                        .foregroundColor(selectedGender == "Male" ? .white : .black)
                }
            }.padding(.top, 60)
  
            Button {
                if selectedGender == "Female" {
                    selectedGender = nil
                } else {
                    selectedGender = "Female"
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedGender == "Female" ? Color.blue : Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    
                    Text(Localization.ViewGender.female).font(CustomFonts.inter.font(size: 18))
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedGender == "Female" ? .white : .black)
                }
            }.padding(.top, 40)

            Button {
                if selectedGender == "Nonbinary" {
                    selectedGender = nil
                } else {
                    selectedGender = "Nonbinary"
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedGender == "Nonbinary" ? Color.blue : Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    
                    Text(Localization.ViewGender.nonbinary).font(CustomFonts.inter.font(size: 18))
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedGender == "Nonbinary" ? .white : .black)
                }
            }.padding(.top, 40)

            Button {

            } label: {

                Text(Localization.ViewGender.next).font(CustomFonts.inter.font(size: 25)).bold()
                    .padding(EdgeInsets(top: 20, leading: 140, bottom: 20, trailing: 140))
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.top, 50)
                    
            }.padding(.top, 40)
            Button {

            } label: {

                Text(Localization.ViewGender.skip).font(CustomFonts.inter.font(size: 18)).bold()
                    .padding(.top, 25)
                    
            }

        }
        .padding()
    }
}
struct ViewGender_Previews: PreviewProvider {
    static var previews: some View {
        ViewGender()
    }
}
