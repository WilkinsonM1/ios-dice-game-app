//
//  ViewController.swift
//  TwoPlayerDiceGame
//
//  Created by CN72 on 24/10/2019.
//  Copyright © 2019 CN72. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //totalscore components

    @IBOutlet weak var totalScore: UILabel!
    
    @IBOutlet weak var totalScore1: UILabel!
    
    @IBOutlet weak var totalScore2: UILabel!
    
    //dice image component
    
    
    @IBOutlet weak var diceImage: UIImageView!
    
    @IBOutlet weak var diceImage1: UIImageView!
    
    @IBOutlet weak var diceImage2: UIImageView!
    
    // message components
    
    @IBOutlet weak var message: UILabel!
    
    
    @IBOutlet weak var message1: UILabel!
    
    @IBOutlet weak var message2: UILabel!
    
    //all dice images in an array
    var allDice = [#imageLiteral(resourceName: "Kismet-Ace"), #imageLiteral(resourceName: "Kismet-Deuce"), #imageLiteral(resourceName: "Kismet-Trey"), #imageLiteral(resourceName: "Kismet-Four"), #imageLiteral(resourceName: "Kismet-Five"), #imageLiteral(resourceName: "Kismet-Six")]
    
    //random number generator for dice index
    var randomDiceIndex: Int = 0
    
    //score variable
    var score: Int = 0
    var score1: Int = 0
    var score2: Int = 0
    
    //player turn component indicator
    @IBOutlet weak var turn: UILabel!
    
    var playerTurn: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    //roll function for 1 player game
    
    @IBAction func rollButton(_ sender: Any) {
        message.text = ""
        randomDiceIndex = Int.random(in: 0...5)
        diceImage.image = allDice[randomDiceIndex]
        score = score + (randomDiceIndex + 1)
        totalScore.text = "\(score)"
        
        rollLogic()
        
        
    }
    
    //roll function for player 1 of multi-player game
    
    @IBAction func rollButton1(_ sender: Any) {
        if(playerTurn == 1){
        message1.text = ""
        randomDiceIndex = Int.random(in: 0...5)
        diceImage1.image = allDice[randomDiceIndex]
        score1 = score1 + (randomDiceIndex + 1)
        totalScore1.text = "\(score1)"
        
            rollLogic1()
            playerTurn = 2
            turn.text = "\(playerTurn)"
        }
        else {
            message1.text = "Not your turn"
        }
        
       
    }
    
    //roll function for player 2 of multi-player game
    @IBAction func rollButton2(_ sender: Any) {
        if(playerTurn == 2){
        message2.text = ""
        randomDiceIndex = Int.random(in: 0...5)
        diceImage2.image = allDice[randomDiceIndex]
        score2 = score2 + (randomDiceIndex + 1)
        totalScore2.text = "\(score2)"
        
        rollLogic2()
        playerTurn = 1
        turn.text = "\(playerTurn)"
        }
        else {
            message2.text = "Not your turn"
        }
       
    }
    
    func rollLogic() {
        if(randomDiceIndex == 0){
            message.text = "You lose"
            score = 0
        }
        else if (score >= 21){
            message.text = "You win!"
            score = 0
        }
        else {
            message.text = "Roll again"

        }
    }
    
    func rollLogic1() {
        if(randomDiceIndex == 0){
            message1.text = "You lose"
            score1 = 0
        }
        else if (score1 >= 21){
            message1.text = "You win!"
            score1 = 0
        }
        else {
            message1.text = ""
            
        }
    }
    
    func rollLogic2() {
        if(randomDiceIndex == 0){
            message2.text = "You lose"
            score2 = 0
        }
        else if (score2 >= 21){
            message2.text = "You win!"
            score2 = 0
        }
        else {
            message2.text = ""
            
        }
    }
    

}

