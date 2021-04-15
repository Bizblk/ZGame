//
//  ViewController.swift
//  ZGame
//
//  Created by Виталий Оранский on 15.04.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var numberOneLabel: UILabel!
    @IBOutlet weak var numberTwoLabel: UILabel!
    @IBOutlet weak var signLabel: UILabel!
    @IBOutlet weak var answerTextField: UITextField!
    @IBOutlet weak var bonusLabel: UILabel!
    
    var game = Game()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bonusLabel.text = "Bonus: \(game.bonus)"
        signLabel.text = "+"
        scoreLabel.text = "Score: \(game.score)"
        getRandomaTaskFromLvl(lvl: game.lvl)
        
        
    }

    @IBAction func answerAction(_ sender: Any) {
        checkResultPlus()
        scoreLabel.text = "Score: \(game.score)"
        bonusLabel.text = "Bonus: \(game.bonus)"

        
        
    }
    
    
    private func checkResultPlus() {
        let valueOne = Int(numberOneLabel.text ?? "0")
        let valueTwo = Int(numberTwoLabel.text ?? "0")
        let userResult = Int(answerTextField.text ?? "0")
        
        let answer = valueOne! + valueTwo!

        if answer == userResult {
            game.count += 1

            if game.count == 5 {
                game.bonus += 1
                print(game.count)
            }
            game.score += 1 * game.bonus
          //  print(game.score)
            getRandomaTaskFromLvl(lvl: game.lvl)
        } else {
            game.score -= 1
            game.bonus = 1
            game.count = 0
          //  print(game.score)
            getRandomaTaskFromLvl(lvl: game.lvl)
        }
    }
    
    private func getRandomaTaskFromLvl(lvl: Int) {
        
        switch lvl {
        case 1:
            numberOneLabel.text = String(Int.random(in: 1...5))
            numberTwoLabel.text = String(Int.random(in: 1...5))
        case 2:
            numberOneLabel.text = String(Int.random(in: 1...10))
            numberTwoLabel.text = String(Int.random(in: 1...10))
        default:
            break
        }
        
    }
    
}

