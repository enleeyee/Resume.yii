//
//  ResumesPageView.swift
//  Resume.yii
//
//  Created by Enlai Yii on 10/24/24.
//

import SwiftUI

struct Resume: Identifiable {
    var id = UUID()
    var title: String
    var description: String
}

struct ResumesPageView: View {
    let resumes = [
        Resume(title: "Expanded Resume", description: "Full resume of the user"),
        Resume(title: "AI Resume", description: "AI-generated resume")
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                CustomColor.Background
                    .ignoresSafeArea(edges: .top)
                
                VStack {
                    List(resumes) { resume in
                        HStack {
                            Text(resume.title)
                                .font(.headline)
                                .foregroundColor(CustomColor.dynamicTextColor)
                            
                            NavigationLink(destination: ResumeDetailView(resume: resume)) {
                                EmptyView()
                            }.opacity(0.0)
                            
                            Spacer()
                            
                            Text("View")
                                .font(.headline)
                                .foregroundColor(CustomColor.dynamicTextColor)
                                .frame(width: 60, height: 30)
                                .background(CustomColor.LightBlue)
                                .cornerRadius(10)
                        }
                    }
                    .listStyle(InsetGroupedListStyle())
                    .scrollContentBackground(.hidden)
                    .background(Color.clear)
                }
            }
            .navigationTitle("Resumes")
        }
    }
}

struct ResumeDetailView: View {
    let resume: Resume
    
    var body: some View {
        ZStack {
            CustomColor.Background
                .ignoresSafeArea(edges: .top)
            
            VStack {
                Text(resume.title)
                    .font(.largeTitle)
                    .foregroundColor(CustomColor.dynamicTextColor)
                    .padding(.bottom, 20)
                
                Text("Details about \(resume.title)")
                    .font(.body)
                    .foregroundColor(CustomColor.dynamicTextColor)
                    .padding(.bottom, 20)
                
                Spacer()
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: downloadResume) {
                    HStack {
                        Image(systemName: "square.and.arrow.down")
                        Text("Download")
                    }
                }
            }
        }
    }
    
    func downloadResume() {
        print("Downloading \(resume.title) as a PDF...")
    }
}

#Preview {
    ResumesPageView()
}
