//
//  ChatGPTResponse.swift
//  Resume.yii
//
//  Created by Enlai Yii on 10/24/24.
//

struct ChatGPTResponse: Codable {
    let choices: [Choice]
}

struct Choice: Codable {
    let message: Message
}
