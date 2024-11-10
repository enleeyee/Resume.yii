//
//  PersonalizationView.swift
//  Resume.yii
//
//  Created by Enlai Yii on 10/24/24.
//

import SwiftUI

struct PersonalizationView: View {
    @Environment(\.dismiss) var dismiss

    @State private var temperature: Double = 0.7
    @State private var maxTokens: Int = 256
    @State private var frequencyPenalty: Double = 0.0
    @State private var presencePenalty: Double = 0.0

    var body: some View {
        NavigationStack {
            ZStack {
                CustomColor.Background
                    .ignoresSafeArea()

                Form {
                    Section(header: Text("PERSONALIZATION")) {
                        VStack(alignment: .leading) {
                            Text("Temperature: \(String(format: "%.2f", temperature))")
                                .foregroundColor(CustomColor.dynamicTextColor)
                            Slider(value: $temperature, in: 0...1, step: 0.01)
                        }
                        .listRowBackground(CustomColor.LightBlue)

                        VStack(alignment: .leading) {
                            Text("Max Tokens: \(maxTokens)")
                                .foregroundColor(CustomColor.dynamicTextColor)
                            Stepper(value: $maxTokens, in: 1...2048) {
                                Text("\(maxTokens)")
                                    .foregroundColor(CustomColor.dynamicTextColor)
                            }
                        }
                        .listRowBackground(CustomColor.LightBlue)

                        VStack(alignment: .leading) {
                            Text("Frequency Penalty: \(String(format: "%.2f", frequencyPenalty))")
                                .foregroundColor(CustomColor.dynamicTextColor)
                            Slider(value: $frequencyPenalty, in: 0...2, step: 0.01)
                        }
                        .listRowBackground(CustomColor.LightBlue)

                        VStack(alignment: .leading) {
                            Text("Presence Penalty: \(String(format: "%.2f", presencePenalty))")
                                .foregroundColor(CustomColor.dynamicTextColor)
                            Slider(value: $presencePenalty, in: 0...2, step: 0.01)
                        }
                        .listRowBackground(CustomColor.LightBlue)
                    }
                }
                .scrollContentBackground(.hidden)
                .background(Color.clear)
            }
            .navigationTitle("Personalization")
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

#Preview {
    PersonalizationView()
}
