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
        VStack {
            gameBody
            restart
        }
        .padding()
    }
    
    var gameBody: some View {
           ScrollView{
               LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], content:{
                   ForEach(viewModel.cards, content: { card in
                       CardView(card: card)
                           .aspectRatio(3/4, contentMode: .fit)
                           .onTapGesture {
                               viewModel.flip(card)
                           }
                   })
               })
               .foregroundColor(.red)
           }
           
    }
    
//    var shuffle: some View {
//        Button("Shuffle") {
//            withAnimation {
//                viewModel.shuffle()
//            }
//        }
//    }
    
    var restart: some View{
        Button("New Game") {
            viewModel.restart()
        }
    }
    
}

//These are what the cards look like and contain inside
struct CardView: View {

    var card: MemoryGame<String>.Card
    
    var body: some View {
        GeometryReader(content: {geometry in
            ZStack {
                if card.faceUp {
                    RoundedRectangle(cornerRadius: 15)
                        .fill()
                        .foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(lineWidth: 4)
                    Text(card.icon)
                        .font(Font.system(size: min(geometry.size.width,geometry.size.height) * 0.75))
                }else if card.isMatch{
                    RoundedRectangle(cornerRadius: 15)
                        .opacity(0)
                }else {
                    RoundedRectangle(cornerRadius: 15)
                        .fill()
                }
            }
        })
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
