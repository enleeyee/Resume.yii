//
//  SignUpView.swift
//  Resume.yii
//
//  Created by Enlai Yii on 10/24/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var password = ""
    
    @State private var isPasswordVisible = false
    @State private var showLoginPage = false
    @State private var showUploadPage = false

    var body: some View {
        ZStack {
            CustomColor.Background
                .ignoresSafeArea()
            
            VStack(spacing: 10) {
                Spacer()

                Image(systemName: "doc.circle.fill")
                    .resizable()
                    .frame(width: 72, height: 72)
                    .foregroundColor(CustomColor.BlueGray)
                    .shadow(radius: 4)
                    .padding(.bottom, 40)

                Text("Create your account")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.dynamicTextColor)
                    .padding(.bottom, 20)

                TextField("\(Text("first name").foregroundColor(CustomColor.dynamicTextColor.opacity(0.4)))", text: $firstName)
                    .padding()
                    .foregroundColor(CustomColor.dynamicTextColor)
                    .background(CustomColor.WhiteBlue)
                    .cornerRadius(10)
                    .frame(width: 280, height: 50)
                    .padding(.bottom, 10)
                    .autocapitalization(.none)

                TextField("\(Text("last name").foregroundColor(CustomColor.dynamicTextColor.opacity(0.4)))", text: $lastName)
                    .padding()
                    .foregroundColor(CustomColor.dynamicTextColor)
                    .background(CustomColor.WhiteBlue)
                    .cornerRadius(10)
                    .frame(width: 280, height: 50)
                    .padding(.bottom, 10)
                    .autocapitalization(.none)

                TextField("\(Text("email address").foregroundColor(CustomColor.dynamicTextColor.opacity(0.4)))", text: $email)
                    .padding()
                    .foregroundColor(CustomColor.dynamicTextColor)
                    .background(CustomColor.WhiteBlue)
                    .cornerRadius(10)
                    .frame(width: 280, height: 50)
                    .padding(.bottom, 10)
                    .autocapitalization(.none)
                    .keyboardType(.emailAddress)

                ZStack(alignment: .trailing) {
                    if isPasswordVisible {
                        TextField("\(Text("password").foregroundColor(CustomColor.dynamicTextColor.opacity(0.4)))", text: $password)
                            .padding()
                            .background(CustomColor.WhiteBlue)
                            .cornerRadius(10)
                            .frame(width: 280, height: 50)
                            .foregroundColor(CustomColor.dynamicTextColor)
                            .autocapitalization(.none)
                    } else {
                        SecureField("\(Text("password").foregroundColor(CustomColor.dynamicTextColor.opacity(0.4)))", text: $password)
                            .padding()
                            .background(CustomColor.WhiteBlue)
                            .cornerRadius(10)
                            .frame(width: 280, height: 50)
                            .foregroundColor(CustomColor.dynamicTextColor)
                    }

                    Button(action: {
                        isPasswordVisible.toggle()
                    }) {
                        Image(systemName: isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(CustomColor.dynamicIconColor)
                    }
                    .padding(.trailing, 10)
                }
                .padding(.bottom, 10)

                Button(action: {
                    showUploadPage = true
                }) {
                    Text("continue")
                        .frame(width: 280, height: 50)
                        .font(.headline)
                        .foregroundColor(CustomColor.dynamicTextColor)
                        .background(CustomColor.LightBlue)
                        .cornerRadius(10)
                }
                .padding(.bottom, 20)

                HStack {
                    Text("Already have an account?")
                        .foregroundColor(CustomColor.dynamicTextColor)
                    Button(action: {
                        showLoginPage = true
                    }) {
                        Text("Login")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(CustomColor.dynamicTextColor)
                            .underline()
                    }
                }
                .padding(.bottom, 30)
                
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $showUploadPage) {
            ResumeUploadView()
        }
        .fullScreenCover(isPresented: $showLoginPage) {
            LoginView()
        }
    }
}

#Preview {
    SignUpView()
}
