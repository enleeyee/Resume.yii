//
//  DataControlsView.swift
//  Resume.yii
//
//  Created by Enlai Yii on 10/24/24.
//

import SwiftUI

struct DataControlsView: View {
    @EnvironmentObject var viewModel: AuthenticationViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var showConfirmationDialog = false
    
    private func deleteAccount() {
      Task {
        if await viewModel.deleteAccount() == true {
          dismiss()
        }
      }
    }

    var body: some View {
        NavigationStack {
            ZStack {
                CustomColor.Background
                    .ignoresSafeArea()

                Form {
                    Section {
                        Button(action: {
                            print("Archive All Chats tapped")
                        }) {
                            Text("Archive All Chats")
                                .foregroundColor(CustomColor.dynamicTextColor)
                        }
                        .listRowBackground(CustomColor.LightBlue)
                        
                        Button(action: {
                            print("Delete All Chats tapped")
                        }) {
                            Text("Delete All Chats")
                                .foregroundColor(.red)
                        }
                        .listRowBackground(CustomColor.LightBlue)
                    }

                    Section {
                        Button(action: {
                            print("Export Data tapped")
                        }) {
                            Text("Export Data")
                                .foregroundColor(CustomColor.dynamicTextColor)
                        }
                        .listRowBackground(CustomColor.LightBlue)

                        Button(role: .destructive, action: { showConfirmationDialog.toggle()
                        }) {
                            Text("Delete Account")
                                .foregroundColor(.red)
                        }
                        .listRowBackground(CustomColor.LightBlue)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
            .navigationTitle("Data Controls")
            .navigationBarTitleDisplayMode(.inline)
            .confirmationDialog("Deleting your account is permanent. Do you want to delete your account?",
                                isPresented: $showConfirmationDialog, titleVisibility: .visible) {
              Button("Delete Account", role: .destructive, action: deleteAccount)
              Button("Cancel", role: .cancel, action: { })
            }
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

#Preview {
    DataControlsView()
        .environmentObject(AuthenticationViewModel())
}
