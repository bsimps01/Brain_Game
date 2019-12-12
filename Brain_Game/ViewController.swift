//
//  ViewController.swift
//  Brain_Game
//
//  Created by Benjamin Simpson on 12/9/19.
//  Copyright © 2019 Benjamin Simpson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    

    @IBOutlet weak var colortextLabel: UILabel!
 
    struct color{
        let textColor = ["Red", "Blue", "Green", "Yellow", "Purple", "Orange"]
        let colors = ["Red":UIColor.red, "Blue":UIColor.blue, "Green":UIColor.green, "Yellow":UIColor.yellow, "Purple":UIColor.purple, "Orange":UIColor.orange]
    }
    
    var score = 0
    var gamePlay = false
    var gameOver = false
    var seconds = 15
    var timer: Timer?
    var matching: Bool = true
    
    func runTimer() {
    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter() {
        timerLabel.text = "Time: \(seconds)"
        if seconds > 0 {
            seconds -= 1
        }
        if seconds <= 0 {
            timer?.invalidate()
            timer = nil
        }
    }
    func randomizer(){
        let colorChoices = color()
        let textWord = colorChoices.textColor.randomElement()
        let matchColor = colorChoices.textColor.randomElement()
        let matchText =  colorChoices.textColor.randomElement()
        
        if textWord == matchColor{
            self.matching = true
        } else {
            self.matching = false
        }

        meaningLabel.text = textWord
        colortextLabel.textColor = colorChoices.colors[matchColor!]
        colortextLabel.text = matchText
    }
        
        
    @IBAction func yesButtonAction(_ sender: Any) {
        if matching{
                self.score+=10
                scoreLabel.text = String(self.score)
                randomizer()
        } else {
                self.score -= 10
                scoreLabel.text = String(self.score)
                randomizer()
            }
        }
    
    

    @IBAction func noButtonTapped(_ sender: Any) {
         if matching{
                self.score+=10
                scoreLabel.text = String(self.score)
                randomizer()
        } else {
                self.score -= 10
                scoreLabel.text = String(self.score)
                randomizer()
                    }
                }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            randomizer()
            runTimer()
        }

    }


