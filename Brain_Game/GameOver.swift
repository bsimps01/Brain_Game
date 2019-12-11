//
//  GameOver.swift
//  Brain_Game
//
//  Created by Benjamin Simpson on 12/11/19.
//  Copyright © 2019 Benjamin Simpson. All rights reserved.
//

import UIKit

class gameOverController: UIViewController {
    
    @IBOutlet var sceneView: UIView!
    @IBOutlet weak var highScoreLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var highScore: Int = 0
    var message: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupScene()
}

    func setupScene() {
        playAgainButton.layer.masksToBounds = true
        playAgainButton.layer.cornerRadius = 20
    
    scoreLabel.text = String(highScore)+" points"
}
    
    @IBAction func playAgain(_ sender: Any) {
    }
}
