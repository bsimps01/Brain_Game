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
        let textColor: [String] = ["Red", "Blue", "Green", "Yellow", "Purple", "Orange"]
        
        let colors = ["Red":UIColor.red, "Blue":UIColor.blue, "Green":UIColor.green, "Yellow":UIColor.yellow, "Purple":UIColor.purple, "Orange":UIColor.orange]
    }
    
    var score = 0
    var gamePlay = false
    var gameOver = false
    var seconds = 60
    var timer: Timer?
    var matching: Bool = true
    
    
    //checks the time in the game
    func runTimer() {
    Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    @objc func updateCounter() {
        timerLabel.text = "Time: \(seconds)"
        if seconds > 0 {
            seconds -= 1
        }
        if seconds == 0 {
            self.seconds = 0
            timer?.invalidate()
            timer = nil
            performSegue(withIdentifier: "Game Over", sender: self)
        }
    }
        //sends the score over to the game over scene
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Game Over" {
            if let GameOver = segue.destination as? gameOverController {
                    GameOver.highScore = self.score
            }
        }
    }
    //checks the logic of colors selected
    func game(){
        let colorChoices = color()
        let textWord = colorChoices.textColor.randomElement()
        let matchColor = colorChoices.textColor.randomElement()
        let matchText =  colorChoices.textColor.randomElement()

        meaningLabel.text = textWord
        colortextLabel.text = matchText
        colortextLabel.textColor = colorChoices.colors[matchColor!]
        
        if (textWord == matchColor) {
            self.matching = true
            
        } else if (matchText != matchColor) {
            self.matching = false
            
        }
        
        if (score <= -1){
            score = 0
            self.performSegue(withIdentifier: "Game Over", sender: self)
        }
    }
        
        //confirms if the action is true
    @IBAction func yesButtonAction(_ sender: Any) {
        if (matching == true) {
            score += 10
            scoreLabel.text = "Score: \(score)"
        } else {
            score -= 10
            scoreLabel.text = "Score: \(score)"
            }
        game()
        }
    
    //confirms if any of the answers are not true
    @IBAction func noButtonTapped(_ sender: Any) {
         if (matching != true){
            score -= 10
            scoreLabel.text = "Score: \(score)"
        } else {
            score += 10
            scoreLabel.text = "Score: \(score)"
                    }
        game()
                }
    //verifies if the game loaded correctly
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
        override func viewDidLoad() {
            super.viewDidLoad()
            game()
            runTimer()
        }

    }


