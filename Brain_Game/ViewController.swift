//
//  ViewController.swift
//  Brain_Game
//
//  Created by Benjamin Simpson on 12/9/19.
//  Copyright © 2019 Benjamin Simpson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: UIView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    
    @IBOutlet weak var colortextLabel: UILabel!
    var highScore: Int = 0
    var score: Int = 0 {
        didSet {
            self.messageLabel.font = UIFont.systemFont(ofSize: 50)
    }
    }
    var timerCount: Int = 5
    var message: String = "Game Over"
    
    let colors: [String: UIColor] = [
        "red": .red,
    "green": .green,
    "yellow": .yellow,
    "purple": .purple,
    "orange": .orange,
    "blue": .blue,
    "black": .black,
    "gray": .gray,
    "white": .white
    ]
    @IBAction func yesButtonAction(_ sender: Any) {
        if(colors[currentText] == currentColor){
            self.check(winOrLose: true)
        }
        else {
            self.check(winOrLose: false)
            }
        refreshGame()
        }
    var currentColor: UIColor = UIColor.white
    var currentText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshGame()
        
        
    }
    @IBAction func noButtonAction(_ sender: Any) { if(colors[currentText] != currentColor){
        self.check(winOrLose: true)
        }
    else {
        self.check(winOrLose: false)
        }
        refreshGame()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showGameOver" {
            if let gameOverController = segue.destination as? gameOverController {
                    gameOverController.highScore = self.highScore
                    gameOverController.message = self.message
    }
            
    func setupScene() {
        meaningLabel.layer.masksToBounds = true
        colortextLabel.layer.masksToBounds = true
        meaningLabel.layer.cornerRadius = 20
        colortextLabel.layer.cornerRadius = 20
        yesButton.layer.cornerRadius = 5
        noButton.layer.cornerRadius = 5
        yesButton.backgroundColor = UIColor.init(displayP3Red: 30, green: 30, blue: 30, alpha: 0.4)
        noButton.backgroundColor = UIColor.init(displayP3Red: 30, green: 30, blue: 30, alpha: 0.4)
        scoreLabel.backgroundColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 0.2)
        scoreLabel.textColor = UIColor(white: 1, alpha: 0.5)
        timerLabel.backgroundColor = UIColor.init(displayP3Red: 0, green: 0, blue: 0, alpha: 0.2)
        timerLabel.textColor = UIColor(white: 1, alpha: 0.5)
}

    func runTimer() {
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
        self.timerCount -= 1
        self.timerLabel.text = "Time  0:0"+String(self.timerCount)+""
        
        if self.timerCount == 0 {
            self.timerCount = 0
            timer.invalidate()
            self.message = "Time is Up!"
            self.performSegue(withIdentifier: "showEndGame", sender: self)
            
        }
        if self.timerCount < 5 {
            self.messageLabel.text = ""
            self.messageLabel.font = UIFont.systemFont(ofSize: 35)
            self.messageLabel.textColor = self.colors.randomElement()?.value
        }
    }
}

    }
    
}
    func check(winOrLose:Bool) {
        var color:UIColor = .white
        var messageStr:String = ""
        
        if (winOrLose == true) {
            self.score += 10
            self.highScore += 10
            color = .green
            messageStr = "Correct! +10"
        }
        else {
            self.score -= 20
            color = .red
            messageStr = "Wrong! -10"
        }
        
    }
    func refreshGame(){
        currentText = colors.randomElement()!.key
        currentColor = colors.randomElement()!.value
        let randomColor = colors.randomElement()?.key
                
        meaningLabel.text = randomColor
        colortextLabel.text = currentText
        meaningLabel.textColor = currentColor
                
                
            if (score <= -1) {
                score = 0
                scoreLabel.text = "HighScore   "+String(highScore)+""
                self.timerCount = 0
                performSegue(withIdentifier: "showGameOver", sender: self)
                    
            } else {
                scoreLabel.text = "Score  "+String(score)+""
                }
            }
}

