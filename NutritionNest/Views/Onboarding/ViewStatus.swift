//
//  ViewStatus.swift
//  NutritionNest
//
//  Created by Oliver on 2023/10/31.
//

import SwiftUI

struct ViewStatus: View {
    @State private var commentText = ""
    @State private var selectedStatus: String?

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
                        .foregroundColor(.black)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 55, height: 8)
                        .foregroundColor(.black)
                        .cornerRadius(4)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 55, height: 8)
                        .foregroundColor(.black)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .frame(width: 55, height: 8)
                        .foregroundColor(.black)
                }
            }.padding(.top, 30)

            Text(Localization.ViewStatus.status).font(CustomFonts.inter.font(size: 30)).padding()
                            
            Button {
                if selectedStatus == "Not active" {
                    selectedStatus = nil
                } else {
                    selectedStatus = "Not active"
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedStatus == "Not active" ? Color.blue : Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    
                    Text(Localization.ViewStatus.notactive).font(CustomFonts.inter.font(size: 18))
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedStatus == "Not active" ? .white : .black)
                }
            }.padding(.top, 30)

            Button {
                if selectedStatus == "Lightly active" {
                    selectedStatus = nil
                } else {
                    selectedStatus = "Lightly active"
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedStatus == "Lightly active" ? Color.blue : Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    
                    Text(Localization.ViewStatus.lightlyactive).font(CustomFonts.inter.font(size: 18))
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedStatus == "Lightly active" ? .white : .black)
                }
            }.padding(.top, 20)

            Button {
                if selectedStatus == "Active" {
                    selectedStatus = nil
                } else {
                    selectedStatus = "Active"
                }
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedStatus == "Active" ? Color.blue : Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    
                    Text(Localization.ViewStatus.active).font(CustomFonts.inter.font(size: 18))
                        .frame(width: 250, height: 85)
                        .foregroundColor(selectedStatus == "Active" ? .white : .black)
                }
            }.padding(.top, 20)
            ZStack {

                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.gray, lineWidth: 1)
                        .frame(width: 250, height: 120)

                    Text(Localization.ViewStatus.comment).font(CustomFonts.inter.font(size: 18))
                        .foregroundColor(.black)
                        .offset(x: 20, y: 20)
                }
                ZStack(alignment: .bottom) {
                    TextField("Ex: active every other month", text: $commentText)
                        .textFieldStyle(PlainTextFieldStyle()).frame(width: 200, height: 70)
                        .padding(.top, 50 ).font(.custom("Inter", size: 13)).offset(x: -5, y: -25)
                    Rectangle()
                            .frame(height: 1)
                            .foregroundColor(.gray)
                            .padding(EdgeInsets(top: -52, leading: 76, bottom: 0, trailing: 80))
                }
     
            }.padding(.top, 20)

            Button {

            } label: {

                Text(Localization.ViewStatus.next).font(CustomFonts.inter.font(size: 25)).bold()
                    .padding(EdgeInsets(top: 20, leading: 140, bottom: 20, trailing: 140))
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                    .padding(.top, 20)
                    
            }.padding(.top, 30)
            Button {

            } label: {

                Text(Localization.ViewStatus.skip).font(CustomFonts.inter.font(size: 18)).bold()
                    .padding(.top, 15)
                    
            }

        }
        .padding()
    }
}

struct ViewStatus_Previews: PreviewProvider {
    static var previews: some View {
        ViewStatus()
    }
}
