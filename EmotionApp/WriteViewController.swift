//
//  ViewController.swift
//  EmotionApp
//
//  Created by 백래훈 on 2023/07/25.
//

import UIKit

class WriteViewController: UIViewController {
    
    @IBOutlet var emotionButtons: [UIButton]!
    
    var numArray = [0, 0, 0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designButton()
    }
    
    @IBAction func emotionButtonTapped(_ sender: UIButton) {
        numArray[sender.tag] += 1
        print("\(sender.tag)번 버튼: \(numArray[sender.tag])회 클릭")
        UserDefaults.standard.set(numArray[sender.tag], forKey: "\(sender.tag)번 버튼")
    }
    
    func designButton() {
        for i in 0..<emotionButtons.count {
            if let emotion = EmotionEnum(rawValue: i) {
                switch emotionButtons[i].tag {
                case i: emotionButtons[i].setTitle("", for: .normal)
                    emotionButtons[i].setImage(UIImage(named: emotion.emotionString), for: .normal)
                    break
                default:
                    break
                }
            } else {
                print("값이 없음.")
            }
        }
    }
}

