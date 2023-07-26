//
//  EmotionEnum.swift
//  EmotionApp
//
//  Created by 백래훈 on 2023/07/25.
//

import Foundation

enum EmotionEnum: Int, CaseIterable {
    case 완전행복 = 0
    case 적당미소 = 1
    case 그냥그냥 = 2
    case 좀속상한 = 3
    case 많이슬픈 = 4
    
    var emotionImageName: String {
        switch self {
        case .완전행복: return "emoji1"
        case .적당미소: return "emoji2"
        case .그냥그냥: return "emoji3"
        case .좀속상한: return "emoji4"
        case .많이슬픈: return "emoji5"
        }
    }
    
    var emotionString: String {
        switch self {
        case .완전행복: return "완전행복지수"
        case .적당미소: return "적당미소지수"
        case .그냥그냥: return "그냥그냥지수"
        case .좀속상한: return "좀속상한지수"
        case .많이슬픈: return "많이슬픈지수"
        }
    }
}
