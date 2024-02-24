//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Богдан Китаев on 29.12.2023.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    let aspectRatio: CGFloat = 2/3
    
    var body: some View {
        
        VStack {
            Text("Запоминай!").font(.system(.title, design: .rounded)).bold()
            cards
            .animation(.default, value: viewModel.cards)
            Spacer()
            Divider()
            Button("Shuffle") {
                viewModel.shuffle()
            }
        }
        .padding()
    }
    
    @ViewBuilder
    var cards: some View {
        AspectVGrid(viewModel.cards, aspectRatio: aspectRatio){ card in
                    CardView(card)
                        .padding(4)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
            }
            .foregroundColor(Color.gray)
        }
}
    


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(card.content)
                    .font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
            .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
            .opacity(card.isFaceUp ? 0 : 1)
        }
        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}



#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
