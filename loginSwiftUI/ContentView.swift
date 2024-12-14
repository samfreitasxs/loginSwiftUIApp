//
//  ContentView.swift
//  loginSwiftUI
//
//  Created by Samuel Freitas on 13/12/24.
//

import SwiftUI

struct ContentView: View {
    @State var username: String = " "
    @State var password: String = " "
    
    var body: some View {
        VStack {
            Text("Welcome Back")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.bottom, 42)
            VStack (spacing: 16.0) {
                InputFieldView(data: $username, title: "Username")
                InputFieldView(data: $password, title: "Password")
            }.padding(.bottom, 16)
            Button(action: {}) {
                Text ("Sign In")
                .fontWeight(.heavy)
                .font(.title3)
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [.red, .yellow]),
                    startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(90)
            }
            HStack {
                Spacer()
                Text ("Forgotten Password?")
                    .fontWeight(.thin)
                    .foregroundColor(Color.blue)
                    .underline()
            }.padding(.top, 16)
        }
    }
}

#Preview {
    ContentView()
}
