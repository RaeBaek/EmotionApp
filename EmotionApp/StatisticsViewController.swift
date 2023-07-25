//
//  StatisticsViewController.swift
//  EmotionApp
//
//  Created by 백래훈 on 2023/07/25.
//

import UIKit

class StatisticsViewController: UIViewController {

    @IBOutlet var views: [UIView]!
    @IBOutlet var clickCountLabel: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designViews()
        clickCountCheck()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clickCountCheck()
    }
    
    func designViews() {
        for i in 0..<views.count {
            views[i].layer.cornerRadius = 5
        }
    }
    
    func clickCountCheck() {
        for i in 0..<clickCountLabel.count {
            print("\(i)번 버튼: \(UserDefaults.standard.integer(forKey: "\(i)번 버튼"))")
            clickCountLabel[i].text = "\(UserDefaults.standard.integer(forKey: "\(i)번 버튼"))번"
        }
    }
}
