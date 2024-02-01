//
//  ContentView.swift
//  Memorize
//
//  Created by Богдан Китаев on 29.12.2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🐰", "🐻", "🦦", "🐟", "🦋", "🍀", "🐿️", "🌧️"]
    @State var cardCount: Int = 2
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            Spacer()
            cardCountAdjusters
            
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.green)
    }
    
    var cardCountAdjusters: some View{
        HStack{
            cardRemover
            Spacer()
            cardAdder
        }.font(.title)
    }
    var cardRemover: some View{
        Button(action:{
            if (cardCount > 1) { cardCount -= 1 }
        }, label:{
            Image(systemName: "rectangle.stack.badge.minus.fill")
        })
    }
    var cardAdder: some View{
        Button(action:{
            if (cardCount < emojis.count) { cardCount += 1 }
        }, label:{
            Image(systemName: "rectangle.stack.badge.plus.fill")
        })
    }
}

struct CardView: View{
    let content: String
    @State var isFaceUp = false
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content)
                    .font(.largeTitle)
            } else{
                base
            }
        }
        .onTapGesture{
            isFaceUp.toggle()
        }
    }
}



#Preview {
    ContentView()
}
