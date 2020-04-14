//
//  CardSelectionVC.swift
//  Card Workout
//
//  Created by UGURCAN KAYA on 4/14/20.
//  Copyright © 2020 Veri Expo. All rights reserved.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var stopButton: UIButton!
    @IBOutlet var cardImageView: UIImageView!
    @IBOutlet var buttons: [UIButton]!
    var cards: [UIImage] = Card.allValues
    var timer: Timer!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        for button in buttons{
            button.layer.cornerRadius = 8
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
        
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(showRandomImg), userInfo: nil, repeats: true)
    }
    @objc func showRandomImg(){
        cardImageView.image = cards.randomElement() ?? UIImage.init(named: "AS")
    }
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        
        
        timer.invalidate()
    }
    @IBAction func restartButtonTapped(_ sender: Any) {
        timer.invalidate()
        startTimer()
    }
    
    
}
