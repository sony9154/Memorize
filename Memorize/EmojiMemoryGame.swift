//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Peter Yo on Jul/14/20.
//  Copyright © 2020 Peter Yo. All rights reserved.
//
//  ==ViewModel==
import SwiftUI

class EmojiMemoryGame {
  private(set) var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
  static func createMemoryGame() -> MemoryGame<String> {
    let emojis = ["👻","🎃", "🕷"]
    return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
      return emojis[pairIndex]
    }
  }
  // MARK: - Access to the Model
  
  var cards: Array<MemoryGame<String>.Card> {
    model.cards
  }
  
  //MARK: - Intent(s)
  
  func choose(card: MemoryGame<String>.Card) {
    model.choose(card: card)
  }
  
}
