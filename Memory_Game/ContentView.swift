//
//  ContentView.swift
//  Memory_Game
//
//  Created by Rita Frias on 10/6/22.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🐵", "🐝", "🐙", "🦀","🐼", "🐻", "🦊", "🐸","🐷", "🐔", "🐥", "🦇","🐶", "🦄", "🦋", "🐢","🐭","🐛", "🐍", "🐬", "🦍","🦩", "🦏", "🦒"]
    
    @State var emojiCount = 30
     

    var body: some View {
        ScrollView{
            VStack{
                LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()], content:{
                    ForEach(emojis[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(icon: emoji)
                    })
                })
            }
            .padding(.horizontal)
            .foregroundColor(.red)
        }
        
    }
}

//These are what the cards look like and contain inside
struct CardView: View {
    var icon: String
    
    @State var faceUp: Bool = false
    
    var body: some View {
        ZStack {
            if faceUp {
                Circle()
                    .fill()
                    .foregroundColor(.white)
                Circle()
                    .stroke(lineWidth: 4)
                Text(icon)
                    .font(.largeTitle)
            }else {
                Circle()
                    .fill()
            }
        }
        .onTapGesture{
            faceUp.toggle()
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
    
}
