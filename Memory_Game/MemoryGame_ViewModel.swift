//
//  MemoryGame_ViewModel.swift
//  Memory_Game
//
//  Created by Rita Frias on 10/7/22.
//

import SwiftUI

class AnimalMemoryGame {
    private var model: MemoryGame<String> = MemoryGame<String>(cardPairsCount: 14)
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
}
