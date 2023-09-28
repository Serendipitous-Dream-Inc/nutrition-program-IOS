//
//  OnboardingView.swift
//  NutritionNest
//
//  Created by LiTianyi on 2023/9/27.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            Text("Welcome to NutritionNest!").font(.system(size: 26)).bold().padding()
            Image("logo")
//                .imageScale(.large)
//                .foregroundColor(.accentColor).padding(.top, 40)
                .resizable()
                   .scaledToFit()
                   .frame(width: 300, height:460)
                   .foregroundColor(.accentColor)
                   .padding(.top, 10)
            Button(action: {
                      
                       }) {
                           Text("Sounds good. Lets Sign up!")
                               .font(.system(size: 18)).bold()
                               .padding(EdgeInsets(top: 28, leading: 26, bottom: 28, trailing: 26))
                               .background(Color.accentColor)
                               .foregroundColor(.white)
                               .cornerRadius(28).padding(.top,-5)
                       }
//            HStack {
//                Text("Have an account?").font(.system(size: 18)).padding(.leading, -80).padding(.top, 28)
//                Button(action: {
//
//                }) {
//                    Text("Log In")
//                        .font(.system(size: 18)).bold()
//                        .padding().foregroundColor(.black).underline()
//
//                }
//            }
            HStack {
                Text("Have an account?")
                    .font(.system(size: 18))
                Button(action: {
                    // Add your button action code here
                }) {
                    Text("Log In")
                        .font(.system(size: 18))
                        .bold()
                        .foregroundColor(.black)
                        .underline()
                }
            }
            .padding(.top, 18)

        }
        .padding()
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
