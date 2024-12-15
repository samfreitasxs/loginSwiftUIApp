//
//  ContentView.swift
//  loginSwiftUI
//
//  Created by Samuel Freitas on 13/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String? = nil
    @State private var isLoading: Bool = false
    @State private var isDarkMode: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome Back")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .padding(.bottom, 42)
                
                VStack(spacing: 16.0) {
                    InputFieldView(data: $username, title: "Username")
                    InputFieldView(data: $password, title: "Password", isSecure: true)
                }
                .padding(.bottom, 16)
                
                // Error Message
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .fontWeight(.semibold)
                        .padding(.bottom, 8)
                }
                
                // Sign In Button
                Button(action: signIn) {
                    if isLoading {
                        ProgressView()
                            .tint(.white)
                    } else {
                        Text("Sign In")
                            .fontWeight(.heavy)
                            .font(.title3)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [.red, .yellow]),
                                                       startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(90)
                    }
                }
                .disabled(isLoading)
                
                // Forgotten Password
                HStack {
                    Spacer()
                    Text("Forgotten Password?")
                        .fontWeight(.thin)
                        .foregroundColor(Color.blue)
                        .underline()
                }
                .padding(.top, 16)
                
                Spacer()
                
                // Dark Mode Toggle
                Toggle("Dark Mode", isOn: $isDarkMode)
                    .padding()
            }
            .padding()
            .preferredColorScheme(isDarkMode ? .dark : .light)
        }
    }
    
    func signIn() {
        // Reset error message
        errorMessage = nil
        
        // Form validation
        guard !username.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Username is required."
            return
        }
        
        guard !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Password is required."
            return
        }
        
        // Simulate Backend Authentication
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            isLoading = false
            if username == "admin" && password == "1234" {
                errorMessage = nil // Successful login
            } else {
                errorMessage = "Invalid username or password."
            }
        }
    }
}

#Preview {
    ContentView()
}
