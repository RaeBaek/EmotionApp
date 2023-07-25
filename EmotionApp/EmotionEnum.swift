//
//  EmotionEnum.swift
//  EmotionApp
//
//  Created by 백래훈 on 2023/07/25.
//

import Foundation

enum EmotionEnum: Int, CaseIterable {
    case 완전행복
    case 적당미소
    case 그냥그냥
    case 좀속상한
    case 많이슬픈
    
    var emotionString: String {
        switch self {
        case .완전행복: return "emoji1"
        case .적당미소: return "emoji2"
        case .그냥그냥: return "emoji3"
        case .좀속상한: return "emoji4"
        case .많이슬픈: return "emoji5"
        }
    }
}
