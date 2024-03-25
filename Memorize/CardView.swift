//
//  CardView.swift
//  Memorize
//
//  Created by Богдан Китаев on 24.02.2024.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    let card: Card
    
    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor )
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
}


private struct Constants{
    static let cornerRadius: CGFloat = 12
    static let lineWidth: CGFloat = 2
    static let inset: CGFloat = 5
    struct FontSize {
        static let largest: CGFloat = 200
        static let smallest: CGFloat = 10
        static let scaleFactor = smallest / largest
    }
    struct Pie {
        static let opacity: CGFloat = 0.5
        static let inset: CGFloat = 5
    }
}


#Preview {
    VStack{
        HStack{
            CardView(MemoryGame<String>.Card(isFaceUp: true, content: "x", id: "test"))
            CardView(MemoryGame<String>.Card(content: "x", id: "test"))
        }
        HStack{
            CardView(MemoryGame<String>.Card(isFaceUp: true, isMatched: true, content: "🥸", id: "test"))
            CardView(MemoryGame<String>.Card(isMatched: true, content: "x",  id: "test"))
        }
    }
    .padding()
    .foregroundColor(.gray)
}
