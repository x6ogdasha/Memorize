//
//  ContentView.swift
//  Memorize
//
//  Created by Богдан Китаев on 29.12.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }
        .padding()
        .foregroundColor(.cyan)
    }
}

struct CardView: View{
    var isFaceUp: Bool = false
    
    var body: some View{
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            
            if isFaceUp{
                base.fill(.white)
                base.strokeBorder(lineWidth: 5)
                Text("🐻")
                    .font(.largeTitle)
            } else{
                base
            }
        }.frame(height: 100)
    }
}



#Preview {
    ContentView()
}
