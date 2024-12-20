//
//  ChatGPTRequest.swift
//  Resume.yii
//
//  Created by Enlai Yii on 10/24/24.
//

struct ChatGPTRequest: Codable {
    let model: String
    let messages: [Message]
    let temperature: Double
    let maxTokens: Int
    let frequencyPenalty: Double
    let presencePenalty: Double
}

struct Message: Codable {
    let role: String
    let content: String
}
