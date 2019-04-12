//
//  Game.swift
//  Apple Pie
//
//  Created by Flint on 3/8/19.
//  Copyright © 2019 Flint. All rights reserved.
// Flint Eller
// 3/8/19
// This app will serve as a hangman-style game


import Foundation

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters: [Character]
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            }
            else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }

    }
}
