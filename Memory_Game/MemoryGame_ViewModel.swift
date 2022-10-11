//
//  MemoryGame_ViewModel.swift
//  Memory_Game
//
//  Created by Rita Frias on 10/7/22.
//

import SwiftUI



class AnimalMemoryGame: ObservableObject{
    static let emojis = ["🐵", "🐝", "🐙", "🦀","🐼", "🐻", "🦊", "🐸","🐷", "🐔", "🐥", "🦇","🐶", "🦄", "🦋", "🐢","🐭","🐛", "🐍", "🐬", "🦍","🦩", "🦏", "🦒"]
    
    
    @Published private var model: MemoryGame<String> =
    MemoryGame<String>(cardPairsCount: 6, createCardContent: {(indexOfPair:Int) -> String in
        return AnimalMemoryGame.emojis[indexOfPair]
    })
    
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    //MARK: - Intent(s)
    
    func flip(_ card: MemoryGame<String>.Card) {
        model.chooseCard(card)
    }
    
    func randomize() {
        model.shuffle()
    }
}
