//
//  LoginView.swift
//  Resume.yii
//
//  Created by Enlai Yii on 10/24/24.
//

import SwiftUI
import Combine
import FirebaseAnalytics

private enum FocusableField: Hashable {
    case email
    case password
}

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    
    @FocusState private var focus: FocusableField?
    
    @State private var email = ""
    @State private var password = ""
    
    @State private var isPasswordVisible = false
//    @State private var showSignUpPage = false
    @State private var showUploadPage = false
    
    private func signInWithEmailPassword() {
        Task {
            if await viewModel.signInWithEmailPassword() == true {
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

                Text("Welcome Back")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(CustomColor.dynamicTextColor)
                    .padding(.bottom, 20)
                
                TextField("\(Text("email address").foregroundColor(CustomColor.dynamicTextColor.opacity(0.4)))", text: $viewModel.email)
                    .padding()
                    .foregroundColor(CustomColor.dynamicTextColor)
                    .background(CustomColor.WhiteBlue)
                    .cornerRadius(10)
                    .frame(width: 280, height: 50)
                    .padding(.bottom, 10)
                    .autocapitalization(.none)

                ZStack(alignment: .trailing) {
                    if isPasswordVisible {
                        TextField("\(Text("password").foregroundColor(CustomColor.dynamicTextColor.opacity(0.4)))", text: $viewModel.password)
                            .padding()
                            .background(CustomColor.WhiteBlue)
                            .cornerRadius(10)
                            .frame(width: 280, height: 50)
                            .foregroundColor(CustomColor.dynamicTextColor)
                            .autocapitalization(.none)
                    } else {
                        SecureField("\(Text("password").foregroundColor(CustomColor.dynamicTextColor.opacity(0.4)))", text: $viewModel.password)
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
                
                if !viewModel.errorMessage.isEmpty {
                  VStack {
                    Text(viewModel.errorMessage)
                      .foregroundColor(Color(UIColor.systemRed))
                  }
                }

                Button(action: signInWithEmailPassword) {
                    if viewModel.authenticationState != .authenticating {
                        Text("continue")
                            .frame(width: 280, height: 50)
                            .font(.headline)
                            .foregroundColor(CustomColor.dynamicTextColor)
                            .background(CustomColor.LightBlue)
                            .cornerRadius(10)
                    }
                    else {
                      ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        .padding(.vertical, 8)
                        .frame(maxWidth: .infinity)
                    }
                }
                .padding(.bottom, 20)
                .disabled(!viewModel.isValid)
                .frame(maxWidth: .infinity)
//                .buttonStyle(.borderedProminent)

                HStack {
                    Text("Don’t have an account?")
                        .foregroundColor(CustomColor.dynamicTextColor)

                    Button(action: {
                        viewModel.switchFlow()
                    }) {
                        Text("Sign Up")
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
//        .fullScreenCover(isPresented: $showSignUpPage) {
//            SignUpView()
//        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthenticationViewModel())
}
