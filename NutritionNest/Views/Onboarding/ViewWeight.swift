//
//  ViewWeight.swift
//  NutritionNest
//
//  Created by Oliver on 2023/10/31.
//

import SwiftUI

struct ViewWeight: View {
    @State private var selectedNumber = 151
        @State private var selectedPoint = 3
    @State private var selectedUnit = "lbs"

        let units = ["lbs", "Kg"]
    let numbers = Array(1...500)
    let decimalPoints = Array(0...9)
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
                            .foregroundColor(.gray)
                    }
                }.padding(.top, -10)

                Text(Localization.ViewWeight.weight).font(CustomFonts.inter.font(size: 25)).padding(.top, 25)
                
                ZStack {
                    RoundedRectangle(cornerRadius: 20).fill(Color.blue).frame(width: 310, height: 35)
                                 .offset(x: 3, y: 0)
                
          HStack {

    Picker("Number", selection: $selectedNumber) {
        ForEach(numbers, id: \.self) { number in
            Text("\(number)").foregroundColor(selectedNumber == number ? Color.white : Color.black)
                .font(selectedNumber == number ? .custom("Inter-Bold", size: 25) : .custom("Inter", size: 20))
        }
    }
    .frame(width: 100)
    .clipped()
    .labelsHidden()
    .pickerStyle(WheelPickerStyle())
    Picker("decimalPoint", selection: $selectedPoint) {
        ForEach(decimalPoints, id: \.self) { point in
            Text(".\(point)").foregroundColor(selectedPoint == point ? Color.white : Color.black)
                .font(selectedPoint == point ? .custom("Inter-Bold", size: 30) : .custom("Inter", size: 20))
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
                .frame(height: 20)
            Spacer()
        }
    )
    Picker("Unit", selection: $selectedUnit) {
        ForEach(units, id: \.self) { unit in
            Text("\(unit)").foregroundColor(selectedUnit == unit ? Color.white : Color.black)
                .font(selectedUnit == unit ? .custom("Inter-Bold", size: 30) : .custom("Inter", size: 20))
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

                    Text(Localization.ViewWeight.next).font(CustomFonts.inter.font(size: 25)).bold()
                        .padding(EdgeInsets(top: 20, leading: 140, bottom: 20, trailing: 140))
                        .background(Color.accentColor)
                        .foregroundColor(.white)
                        .cornerRadius(20)
                        .padding(.top, 50)

                }.padding(.top, 150)
                Button {

                } label: {

                    Text(Localization.ViewWeight.skip).font(CustomFonts.inter.font(size: 18)).bold()
                        .padding(.top, 25)

                }

            }
            .padding()
        }
    }
struct ViewWeight_Previews: PreviewProvider {
    static var previews: some View {
        ViewWeight()
    }
}
