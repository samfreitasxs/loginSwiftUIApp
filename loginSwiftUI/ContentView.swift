//
//  ContentView.swift
//  loginSwiftUI
//
//  Created by Samuel Freitas on 13/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Welcome Back")
                .font(.largeTitle)
                .fontWeight(.black)
                .padding(.bottom, 42)
            Button(action: {}) {
                Text ("Sign In")
                .fontWeight(.heavy)
                .font(.title3)
                .frame(maxWidth: .infinity)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [.pink, .purple]),
                    startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(33)
            }
            HStack {
                Spacer()
                Text (" Forgotten Password")
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
