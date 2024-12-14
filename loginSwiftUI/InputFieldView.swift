//
//  InputFieldView.swift
//  loginSwiftUI
//
//  Created by Samuel Freitas on 13/12/24.
//

import SwiftUI

struct InputFieldView: View {
    @Binding var data: String
    var title: String?
    var isSecure: Bool = false
    
    @State private var isPasswordVisible: Bool = false

    var body: some View {
        ZStack {
            if isSecure && !isPasswordVisible {
                SecureField("", text: $data)
                    .padding(.horizontal, 10)
                    .frame(height: 42)
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                            .stroke(Color.gray, lineWidth: 1)
                    )
            } else {
                TextField("", text: $data)
                    .padding(.horizontal, 10)
                    .frame(height: 42)
                    .overlay(
                        RoundedRectangle(cornerSize: CGSize(width: 4, height: 4))
                            .stroke(Color.gray, lineWidth: 1)
                    )
            }

            HStack {
                // Title Text
                Text(title ?? "Input")
                    .font(.headline)
                    .fontWeight(.thin)
                    .foregroundColor(Color.gray)
                    .multilineTextAlignment(.leading)
                    .padding(4)
                    .background(Color.white)
                Spacer()
                
                // Eye Icon for Secure Fields
                if isSecure {
                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye" : "eye.slash")
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 8)
                }
            }
            .padding(.leading, 8)
            .offset(CGSize(width: 0, height: -20))
        }
        .padding(4)
    }
}

struct InputFieldView_Previews: PreviewProvider {
    @State static var data: String = ""
    
    static var previews: some View {
        VStack {
            InputFieldView(data: $data, title: "Password", isSecure: true)
            InputFieldView(data: $data, title: "Username")
        }
    }
}
