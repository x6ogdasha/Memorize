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
    let spacing: CGFloat = 4
    
    var body: some View {
        
        VStack {
            Text("Запоминай!").font(.system(.title, design: .rounded)).bold()
            cards
            .foregroundColor(viewModel.color)
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
                        .padding(spacing)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
            }
        }
}
    



#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
