//
//  ViewController.swift
//  Three Card Monte
//
//  Created on 10/16/17.
//  Copyright © 2017. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var winLoseLabel: UILabel!
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var winLabel: UILabel!
    @IBOutlet var loseLabel: UILabel!
    var kingIsHere: UIButton!
    var loseCounter = 0
    var winCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        winLabel.text = "Wins: \(winCounter)"
        loseLabel.text = "Loses: \(loseCounter)"
        
        button1.tag = Int(arc4random_uniform(2))
        if button1.tag == 1 {
            button2.tag = 0
            button3.tag = 0
            kingIsHere = button1
            return
        }
        
        button2.tag = Int(arc4random_uniform(2))
        if button2.tag == 1 {
            button1.tag = 0
            button3.tag = 0
            kingIsHere = button2
            return
        }
        
        button3.tag = Int(arc4random_uniform(2))
        if button3.tag == 1 {
            button1.tag = 0
            button2.tag = 0
            kingIsHere = button3
            return
        }
        button1.tag = 0
        button2.tag = 1
        button3.tag = 0
        kingIsHere = button2
    }

    
    @IBAction func chooseCard(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            winLoseLabel.text = "Success!"
            sender.setImage(#imageLiteral(resourceName: "queen"), for: .normal)
            winCounter += 1
            winLabel.text = "Win: \(winCounter)"
        default:
            winLoseLabel.text = "The Darkness Consumes You!"
            sender.setImage(#imageLiteral(resourceName: "jack"), for: .normal)
            kingIsHere.setImage(#imageLiteral(resourceName: "queen"), for: .normal)
            loseCounter += 1
            loseLabel.text = "Loses: \(loseCounter)"
        }
        
        button1.isEnabled = false
        button2.isEnabled = false
        button3.isEnabled = false
    }
    
    @IBAction func startNewGame(_ sender: UIButton) {
        button1.tag = Int(arc4random_uniform(2))
        if button1.tag == 1 {
            button2.tag = 0
            button3.tag = 0
            
            kingIsHere = button1
            
            button1.setImage(#imageLiteral(resourceName: "ghost"), for: .normal)
            button2.setImage(#imageLiteral(resourceName: "ghost"), for: .normal)
            button3.setImage(#imageLiteral(resourceName: "ghost"), for: .normal)
            
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            
            winLoseLabel.text = "Pick a card:"
            
            return
        }
        button2.tag = Int(arc4random_uniform(2))
        if button2.tag == 1 {
            button1.tag = 0
            button3.tag = 0
            
            kingIsHere = button2
            
            button1.setImage(#imageLiteral(resourceName: "ghost"), for: .normal)
            button2.setImage(#imageLiteral(resourceName: "ghost"), for: .normal)
            button3.setImage(#imageLiteral(resourceName: "ghost"), for: .normal)
            
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            
            winLoseLabel.text = "Pick a card:"
            
            return
        }
        
        button3.tag = Int(arc4random_uniform(2))
        if button3.tag == 1 {
            button1.tag = 0
            button2.tag = 0
            
            kingIsHere = button3
            
            button1.setImage(#imageLiteral(resourceName: "ghost"), for: .normal)
            button2.setImage(#imageLiteral(resourceName: "ghost"), for: .normal)
            button3.setImage(#imageLiteral(resourceName: "ghost"), for: .normal)
            
            button1.isEnabled = true
            button2.isEnabled = true
            button3.isEnabled = true
            
            winLoseLabel.text = "Pick a card:"
            
            return
        }
        button1.tag = 0
        button2.tag = 1
        button3.tag = 0
        kingIsHere = button2
        
        button1.setImage(#imageLiteral(resourceName: "ghost"), for: .normal)
        button2.setImage(#imageLiteral(resourceName: "ghost"), for: .normal)
        button3.setImage(#imageLiteral(resourceName: "ghost"), for: .normal)
        
        button1.isEnabled = true
        button2.isEnabled = true
        button3.isEnabled = true
        winLoseLabel.text = "Pick a card:"
    }

}

