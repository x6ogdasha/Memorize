//
//  ContentView.swift
//  Memorize
//
//  Created by Богдан Китаев on 29.12.2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: [String] = ["🐰","🐻","🦦","🐟"]
    
    var body: some View {
        HStack {
            ForEach(emojis.indices, id: \.self){ index in
                CardView(content: emojis[index])
            }
        }
        .padding()
        .foregroundColor(.cyan)
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
