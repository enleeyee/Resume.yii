//
//  ArchivedResumesView.swift
//  Resume.yii
//
//  Created by Enlai Yii on 10/24/24.
//

import SwiftUI

struct ArchivedResumesView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            ZStack {
                CustomColor.Background
                    .ignoresSafeArea()

                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(CustomColor.dynamicTextColor.opacity(0.4))
                        Text("Search Archive")
                            .foregroundColor(CustomColor.dynamicTextColor.opacity(0.4))
                        Spacer()
                    }
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)

                    ScrollView {
                        VStack(alignment: .leading, spacing: 30) {
                            Text("No Archived Resumes")
                        }
                        .padding(.horizontal)
                    }
                }
            }
            .navigationTitle("Archived Resumes")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(CustomColor.dynamicIconColor)
                    }
                }
            }
        }
    }
}

struct ArchivedSectionView: View {
    let title: String
    let chats: [String]

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.headline)
                .foregroundColor(CustomColor.dynamicTextColor)

            ForEach(chats, id: \.self) { chat in
                Text(chat)
                    .font(.body)
                    .foregroundColor(CustomColor.dynamicTextColor)
                    .padding(.vertical, 10)
                Divider()
                    .background(Color.gray)
            }
        }
    }
}

#Preview {
    ArchivedResumesView()
}
