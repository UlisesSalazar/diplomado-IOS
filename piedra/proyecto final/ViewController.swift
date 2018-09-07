//
//  ViewController.swift
//  proyecto final
//
//  Created by Ulises on 11/08/18.
//  Copyright © 2018 Ulises. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alienLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var currentGameState : GameState = GameState.start
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetBoard()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func resetBoard ( )  {
        alienLabel . text = "👽"
        statusLabel . text = "Rock, Paper, Scissor?"
        rockButton.isHidden = false
        rockButton.isEnabled = true
        paperButton.isHidden =  false
        paperButton.isEnabled = true
        scissorButton.isHidden = false
        scissorButton.isEnabled = true
        playAgainButton.isHidden = true
    }
    
    func play(_ playerTurn: Sign ) {
        rockButton . isEnabled = false
        paperButton . isEnabled = false
        scissorButton . isEnabled = false
        
        let opponet = randomSign()
         alienLabel .text = opponet . emoji
        
        currentGameState = playerTurn.takeTurn(opponet)
        switch currentGameState {
        case .draw:
            statusLabel .text = "it´s a draw."
        case . lose:
            statusLabel .text = "sorry you stupid"
        case . win:
            statusLabel .text = " you winner!"
        case .start:
            statusLabel .text = " rock,  paper,  scissor?"
        }
        switch playerTurn {
        case .rock:
            rockButton .isHidden =  false
            paperButton.isHidden = true
            scissorButton .isHidden = true
        case . paper:
            rockButton .isHidden =  true
            paperButton.isHidden = false
            scissorButton .isHidden = true
            
        case . scissor:
            rockButton .isHidden =  true
            paperButton.isHidden = true
            scissorButton .isHidden = false
            
      
        }
        playAgainButton . isHidden = false
    }
    @IBAction func playAgainSelected(_ sender: Any) {
       resetBoard()
    }
    @IBAction func rockSelected(_ sender: Any) {
     play (Sign . rock)
    }
    @IBAction func paperSelected(_ sender: Any) {
        play(Sign .paper)
    }
    @IBAction func scissorSelected(_ sender: Any) {
        play(Sign .scissor)
    }
    
}

