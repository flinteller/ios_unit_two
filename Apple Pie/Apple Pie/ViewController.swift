//
//  ViewController.swift
//  Apple Pie
//
//  Created by Flint on 3/8/19.
//  Copyright © 2019 Flint. All rights reserved.
// Flint Eller
// 3/8/19
// This app will serve as a hangman-style game

import UIKit

class ViewController: UIViewController {
    var listOfWords = ["apple", "lemon", "cherry", "pear", "brian", "james", "mark", "david", "coding", "running", "dancing", "woodworking", "lamp", "carpet", "couch", "table", "soccer", "baseball", "tennis", "football", "golf", "swimming"]
    
    let incorrectMovesAllowed = 7
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    var currentGame: Game!
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
        
    }
    
    func enableLetterButtons(_ enable : Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    @IBOutlet weak var treeImageview: UIImageView!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
        updateUI()
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        }
        else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        }
        else {
            updateUI()
        }
    }
    
    func updateUI() {
        var letters = [String]()
        for letter in currentGame.formattedWord{
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageview.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
    }
   

}

