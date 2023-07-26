//
//  ViewController.swift
//  EmotionApp
//
//  Created by 백래훈 on 2023/07/25.
//

import UIKit

class WriteViewController: UIViewController {
    
    @IBOutlet var emotionButtons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setButtonIndex()
        designButton()
    }
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        plusNScore(sender, score: 1)
        
    }
    
    func setButtonIndex() {
        emotionButtons[0].tag = EmotionEnum.완전행복.rawValue
        emotionButtons[1].tag = EmotionEnum.적당미소.rawValue
        emotionButtons[2].tag = EmotionEnum.그냥그냥.rawValue
        emotionButtons[3].tag = EmotionEnum.좀속상한.rawValue
        emotionButtons[4].tag = EmotionEnum.많이슬픈.rawValue
    }
    
    func designButton() {
        for i in 0..<emotionButtons.count {
            let plusOne = UIAction(title: "+ 1점", handler: { [self] _ in plusNScore(emotionButtons[i], score: 1) })
            let plusfive = UIAction(title: "+ 5점", handler: { [self] _ in plusNScore(emotionButtons[i], score: 5) })
            let plusten = UIAction(title: "+ 10점", handler: { [self] _ in plusNScore(emotionButtons[i], score: 10) })
            
            if let emotion = EmotionEnum(rawValue: i) {
                switch emotionButtons[i].tag {
                case i: emotionButtons[i].setTitle("", for: .normal)
                    emotionButtons[i].setImage(UIImage(named: emotion.emotionImageName), for: .normal)
                    let buttonMenu = UIMenu(title: emotion.emotionString, children: [plusOne, plusfive, plusten])
                    emotionButtons[i].menu = buttonMenu
                    break
                default:
                    break
                }
            } else {
                print("오류가 발생했습니다. 확인해주세요.")
            }
        }
    }
    
    func plusNScore(_ sender: UIButton, score: Int) {
        // 저장 버튼 클릭 횟수 저장 기능
        // 1. 저장된 횟수 가지고 오기
        let value = UserDefaults.standard.integer(forKey: "\(sender.tag)")
        // 2. 저장된 홧수에 score를 더하기
        let result = value + score
        // 3. 2번에서 나온 결과를 다시 저장해주기
        UserDefaults.standard.set(result, forKey: "\(sender.tag)")
        // 4. 확인
        if let index = EmotionEnum(rawValue: sender.tag) {
            print("\(index.emotionString)버튼: \(UserDefaults.standard.integer(forKey: "\(sender.tag)"))회 클릭")
        }
    }
}

