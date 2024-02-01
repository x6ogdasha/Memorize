//
//  ContentView.swift
//  Memorize
//
//  Created by Богдан Китаев on 29.12.2023.
//

import SwiftUI

struct ContentView: View {
    let wild: [String] = ["🐰", "🐻", "🦦", "🐟", "🦋", "🐿️"]
    let food: [String] = ["🍔", "🍗", "🍰", "🍕", "🥟", "🍪", "🍩", "🥗", "🍤"]
    let face: [String] = ["😊", "😘", "😜", "🤩", "😎", "🤤", "🤠", "🤥"]
    @State var emojis: [String] = []
    @State var cardCount: Int = 2
    
    var body: some View {
        
        VStack{
            Text("Запоминай!").font(.system(.title, design: .rounded)).bold()
            ScrollView{
                cards
            }
            Spacer()
            themeChangingHandlers
        }
        .padding()
    }
    
    var cards: some View{
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
            ForEach(0..<emojis.count, id: \.self){ index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.green)
    }
    var themeChangingHandlers: some View{
        HStack{
            wildTheme
            Spacer()
            foodTheme
            Spacer()
            faceTheme
        }.font(.title)
    }
    func themeChangingHandler(to theme: String, symbol: String) -> some View{
        Button(action:{
            switch(theme){
            case "wild":
                emojis.replace(emojis, with: wild)
            case "food":
                emojis.replace(emojis, with: food)
            case "face":
                emojis.replace(emojis, with: face)
            default:
                print("problem")
            }
            emojis.append(contentsOf: emojis)
            emojis.shuffle()
        }, label:{
            VStack{
                Image(systemName: symbol)
                Text(theme).font(.system(size: 15, design: .rounded))
            }
            
        })
    }
    var wildTheme: some View{
        themeChangingHandler(to: "Природа", symbol: "tree")
    }
    var foodTheme: some View{
        themeChangingHandler(to: "Еда", symbol: "carrot")
    }
    var faceTheme: some View{
        themeChangingHandler(to: "Лица", symbol: "face.smiling")
    }
}

struct CardView: View{
    let content: String
    @State var isFaceUp = false
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            Group {
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture{
            isFaceUp.toggle()
        }
    }
}



#Preview {
    ContentView()
}
