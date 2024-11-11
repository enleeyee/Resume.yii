//
//  SignUpView.swift
//  Resume.yii
//
//  Created by Enlai Yii on 10/24/24.
//

import SwiftUI

private enum FocusableField: Hashable {
    case firstName
    case lastName
    case email
    case password
    case confirmPassword
}

struct SignUpView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var focus: FocusableField?
    
    @State private var firstName = ""
    @State private var lastName = ""
    
    @State private var isPasswordVisible = false
    @State private var showUploadPage = false
    
    private func signUpWithEmailPassword() {
        Task {
            if await viewModel.signUpWithEmailPassword() == true {
                dismiss()
            }
        }
    }

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

//                TextField("\(Text("first name").foregroundColor(CustomColor.dynamicTextColor.opacity(0.4)))", text: $firstName)
//                    .padding()
//                    .foregroundColor(CustomColor.dynamicTextColor)
//                    .background(CustomColor.WhiteBlue)
//                    .cornerRadius(10)
//                    .frame(width: 280, height: 50)
//                    .padding(.bottom, 10)
//                    .autocapitalization(.none)
//
//                TextField("\(Text("last name").foregroundColor(CustomColor.dynamicTextColor.opacity(0.4)))", text: $lastName)
//                    .padding()
//                    .foregroundColor(CustomColor.dynamicTextColor)
//                    .background(CustomColor.WhiteBlue)
//                    .cornerRadius(10)
//                    .frame(width: 280, height: 50)
//                    .padding(.bottom, 10)
//                    .autocapitalization(.none)

                TextField("\(Text("email address").foregroundColor(CustomColor.dynamicTextColor.opacity(0.4)))", text: $viewModel.email)
                    .focused($focus, equals: .email)
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
                        TextField("\(Text("password").foregroundColor(CustomColor.dynamicTextColor.opacity(0.4)))", text: $viewModel.password)
                            .focused($focus, equals: .password)
                            .padding()
                            .background(CustomColor.WhiteBlue)
                            .cornerRadius(10)
                            .frame(width: 280, height: 50)
                            .foregroundColor(CustomColor.dynamicTextColor)
                            .autocapitalization(.none)
                    } else {
                        SecureField("\(Text("password").foregroundColor(CustomColor.dynamicTextColor.opacity(0.4)))", text: $viewModel.password)
                            .focused($focus, equals: .password)
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
                
                ZStack(alignment: .trailing) {
                    if isPasswordVisible {
                        TextField("\(Text("confirm password").foregroundColor(CustomColor.dynamicTextColor.opacity(0.4)))", text: $viewModel.confirmPassword)
                            .focused($focus, equals: .confirmPassword)
                            .padding()
                            .background(CustomColor.WhiteBlue)
                            .cornerRadius(10)
                            .frame(width: 280, height: 50)
                            .foregroundColor(CustomColor.dynamicTextColor)
                            .autocapitalization(.none)
                    } else {
                        SecureField("\(Text("confirm password").foregroundColor(CustomColor.dynamicTextColor.opacity(0.4)))", text: $viewModel.confirmPassword)
                            .focused($focus, equals: .confirmPassword)
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

                Button(action: signUpWithEmailPassword) {
                    if viewModel.authenticationState != .authenticating {
                        Text("continue")
                            .frame(width: 280, height: 50)
                            .font(.headline)
                            .foregroundColor(CustomColor.dynamicTextColor)
                            .background(CustomColor.LightBlue)
                            .cornerRadius(10)
                    } else {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .white))
                            .padding(.vertical, 8)
                            .frame(maxWidth: .infinity)
                    }
                }
                .padding(.bottom, 20)
                .disabled(!viewModel.isValid)
                .frame(maxWidth: .infinity)

                HStack {
                    Text("Already have an account?")
                        .foregroundColor(CustomColor.dynamicTextColor)
                    Button(action: {
                        viewModel.switchFlow()
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
    }
}

#Preview {
    SignUpView()
}
