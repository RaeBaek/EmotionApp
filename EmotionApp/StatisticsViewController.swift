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
    @IBOutlet var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designViews()
//        clickCountCheck()
        designResetButton()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        clickCountCheck()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        setAlert()
    }
    
    func designViews() {
        for i in 0..<views.count {
            views[i].layer.cornerRadius = 5
        }
    }
    
    func designResetButton() {
        resetButton.tintColor = .black
        resetButton.layer.borderWidth = 1
        resetButton.layer.borderColor = UIColor.black.cgColor
        resetButton.layer.cornerRadius = 5
    }
    
    func clickCountCheck() {
        for i in 0..<clickCountLabel.count {
            if EmotionEnum(rawValue: i) != nil {
                clickCountLabel[i].text = "\(UserDefaults.standard.integer(forKey: "\(i)"))점"
            }
        }
    }
    
    func setAlert() {
        let alert = UIAlertController(title: "주의하세요!", message: "한 번 초기화를 하시면 돌이킬 수 없습니다. 확인하셨습니까?", preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "취소", style: .destructive)
        let ok = UIAlertAction(title: "확인", style: .default, handler: { [self] _ in userdefaultsReset() })
        
        alert.addAction(cancel)
        alert.addAction(ok)
        
        present(alert, animated: true)
        
    }
    
    func userdefaultsReset() {
        for key in UserDefaults.standard.dictionaryRepresentation().keys {
            UserDefaults.standard.removeObject(forKey: key)
        }
        clickCountCheck()
    }
}
