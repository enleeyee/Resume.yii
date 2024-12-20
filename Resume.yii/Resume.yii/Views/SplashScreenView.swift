//
//  SplashScreenView.swift
//  Resume.yii
//
//  Created by Enlai Yii on 10/24/24.
//

import SwiftUI

struct SplashScreenView: View {
    @State var isActive: Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            AuthenticatedView {
                MainTabView()
            }
        } else {
            ZStack {
                CustomColor.Background
                    .ignoresSafeArea()
                VStack {
                    Image(systemName: "doc.circle.fill")
                        .resizable()
                        .frame(width: 72, height: 72)
                        .foregroundColor(CustomColor.BlueGray)
                        .shadow(radius: 4)
                        .padding(.bottom, 40)
                    
                    Text("Resume.yii")
                        .bold()
                        .font(.title)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}
