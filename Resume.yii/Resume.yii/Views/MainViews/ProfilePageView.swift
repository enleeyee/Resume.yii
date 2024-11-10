//
//  ProfilePageView.swift
//  Resume.yii
//
//  Created by Enlai Yii on 10/24/24.
//

import SwiftUI

struct ProfilePageView: View {
    @State private var selectedColorScheme = "Light"
    @State private var showPersonalization = false
    @State private var showDataControls = false
    @State private var showArchivedResumes = false
    
    @State private var showLandingPage = false

    var body: some View {
        NavigationStack {
            ZStack {
                CustomColor.Background
                    .ignoresSafeArea(edges: .top)

                Form {
                    Section(header: Text("ACCOUNT")) {
                        HStack {
                            Label("Email", systemImage: "envelope")
                                .foregroundColor(CustomColor.dynamicTextColor)
                            Spacer()
                            Text("example@gmail.com")
                                .foregroundColor(CustomColor.dynamicTextColor)
                        }
                        .listRowBackground(CustomColor.LightBlue)

                        Button(action: {
                            showPersonalization = true
                        }) {
                            HStack {
                                Label("Personalization", systemImage: "person")
                                    .foregroundColor(CustomColor.dynamicTextColor)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(CustomColor.dynamicTextColor)
                            }
                        }
                        .listRowBackground(CustomColor.LightBlue)

                        Button(action: {
                            showDataControls = true
                        }) {
                            HStack {
                                Label("Data Controls", systemImage: "server.rack")
                                    .foregroundColor(CustomColor.dynamicTextColor)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(CustomColor.dynamicTextColor)
                            }
                        }
                        .listRowBackground(CustomColor.LightBlue)

                        Button(action: {
                            showArchivedResumes = true
                        }) {
                            HStack {
                                Label("Archived Resumes", systemImage: "archivebox")
                                    .foregroundColor(CustomColor.dynamicTextColor)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(CustomColor.dynamicTextColor)
                            }
                        }
                        .listRowBackground(CustomColor.LightBlue)
                    }

                    Section(header: Text("APP")) {
                        HStack {
                            Label("App Language", systemImage: "globe")
                                .foregroundColor(CustomColor.dynamicTextColor)
                            Spacer()
                            Text("English")
                                .foregroundColor(CustomColor.dynamicTextColor)
                        }
                        .listRowBackground(CustomColor.LightBlue)

                        Picker(selection: $selectedColorScheme, label: Label("Color Scheme", systemImage: "sun.max")
                            .foregroundColor(CustomColor.dynamicTextColor)
                        ) {
                            Text("Light")
                                .foregroundColor(CustomColor.dynamicTextColor)
                                .tag("Light")
                                .padding()
                            
                            Text("Dark")
                                .foregroundColor(CustomColor.dynamicTextColor)
                                .tag("Dark")
                                .padding()
                        }
                        .listRowBackground(CustomColor.LightBlue)
                    }

                    Section {
                        Button(action: {
                            showLandingPage = true
                        }) {
                            Label("Log Out", systemImage: "rectangle.portrait.and.arrow.right")
                                .foregroundColor(CustomColor.dynamicTextColor)
                        }
                        .listRowBackground(CustomColor.LightBlue)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
            .navigationTitle("Profile")
            .sheet(isPresented: $showPersonalization) {
                PersonalizationView()
            }
            .sheet(isPresented: $showDataControls) {
                DataControlsView()
            }
            .sheet(isPresented: $showArchivedResumes) {
                ArchivedResumesView()
            }
            .fullScreenCover(isPresented: $showLandingPage) {
                LoginView()
            }
        }
    }
}

#Preview {
    ProfilePageView()
}
