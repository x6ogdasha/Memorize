//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Богдан Китаев on 04.02.2024.
//

import Foundation

struct MemoryGame<CardContent> { // Типа модель
   private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2
        for pairIndex in 0 ..< max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    func choose(_ card: Card){
        
    }
    
    struct Card{
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
