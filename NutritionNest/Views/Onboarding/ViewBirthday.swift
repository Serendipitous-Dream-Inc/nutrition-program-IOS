//
//  ViewBirthday.swift
//  NutritionNest
//
//  Created by Oliver on 2023/10/31.
//

import SwiftUI

struct ViewBirthday: View {
    @State private var selectedMonth = "May"
    @State private var selectedDay = 6
    @State private var selectedYear = 2000

        let months = ["Jan", "Feb", "March", "April", "May", "June", "July", "August", "Sept", "Oct", "Nov", "Dec"]
    let days = Array(1...31)
    let years = Array(1900...2023)
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
                            .foregroundColor(.gray)

                        RoundedRectangle(cornerRadius: 4)
                            .frame(width: 55, height: 8)
                            .foregroundColor(.gray)
                    }
                }.padding(.top, -10)

                Text("What is your Birthdate?").font(.custom("Inter", size: 26)).padding(.top, 25)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20).fill(Color.blue).frame(width: 310, height: 35)
                                 .offset(x: 3, y: 0)
                
          HStack {

    Picker("Month", selection: $selectedMonth) {
        ForEach(months, id: \.self) { month in
            Text("\(month)").foregroundColor(selectedMonth == month ? Color.white : Color.black)
                .font(selectedMonth == month ? .custom("Inter-Bold", size: 25) : .custom("Inter", size: 20))
            }
    }
    .frame(width: 100)
    .clipped()
    .labelsHidden()
    .pickerStyle(WheelPickerStyle())
    Picker("Day", selection: $selectedDay) {
        ForEach(days, id: \.self) { day in
            Text("\(day)").foregroundColor(selectedDay == day ? Color.white : Color.black).font(selectedDay == day ?
                .custom("Inter-Bold", size: 30) : .custom("Inter", size: 20))
        }
    }
    .frame(width: 100)
    .clipped()
    .labelsHidden()
    .pickerStyle(WheelPickerStyle())
    .overlay(
        VStack {
            Spacer()
            Rectangle()
                .fill(Color.clear)
                .frame(height: 20) // Adjust the height to control the spacing
            Spacer()
        }
    )
    Picker("Year", selection: $selectedYear) {
        ForEach(years, id: \.self) { year in
            Text("\(year)").foregroundColor(selectedYear == year ? Color.white : Color.black)
                .font(selectedYear == year ? .custom("Inter-Bold", size: 30) : .custom("Inter", size: 20))
        }
    }
    .frame(width: 100)
    .clipped()
    .labelsHidden()
    .pickerStyle(WheelPickerStyle())

    }
}.padding(.top, 120)

                Button {

                } label: {

                    Text("Next")
                        .font(.custom("Inter", size: 25)).bold()
                        .padding(EdgeInsets(top: 20, leading: 140, bottom: 20, trailing: 140))
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(.top, 50)

                }.padding(.top, 150)
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

struct ViewBirthday_Previews: PreviewProvider {
    static var previews: some View {
        ViewBirthday()
    }
}
