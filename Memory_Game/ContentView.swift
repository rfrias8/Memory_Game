//
//  ContentView.swift
//  Memory_Game
//
//  Created by Rita Frias on 10/6/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: AnimalMemoryGame
    
    var body: some View {
           ScrollView{
               LazyVGrid(columns: [GridItem(),GridItem(),GridItem(),GridItem()], content:{
                   ForEach(viewModel.cards, content: { card in
                       CardView(card: card)
                           .aspectRatio(3/4, contentMode: .fit)
                           .onTapGesture {
                               viewModel.flip(card)
                           }
                   })
               })
               .padding(.horizontal)
               .foregroundColor(.red)
           }
           
       }
}

//These are what the cards look like and contain inside
struct CardView: View {

    var card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            if card.faceUp {
                RoundedRectangle(cornerRadius: 15)
                    .fill()
                    .foregroundColor(.white)
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 4)
                Text(card.icon)
                    .font(.largeTitle)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    
            }else {
                RoundedRectangle(cornerRadius: 15)
                    .fill()
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let game = AnimalMemoryGame()
        
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
    
}
