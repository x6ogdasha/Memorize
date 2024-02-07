//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Богдан Китаев on 04.02.2024.
//

import SwiftUI // ViewModel часть UI

class EmojiMemoryGame {
    private static let emojis = ["🐰", "🐻", "🦦", "🐟", "🦋", "🐿️"]
    
    private static func createMemoryGame() -> MemoryGame<String>{
        MemoryGame<String>(numberOfPairsOfCards: 6) { pairIndex in
            if (emojis.indices.contains(pairIndex)){
                return emojis[pairIndex]
            } else{
                return "😬"
            }
       }
    }
    
    private var model = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    func choose(_ card: MemoryGame<String>.Card ){
        model.choose(card)
    }
}
