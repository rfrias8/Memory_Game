//
//  MemoryGame_Model.swift
//  Memory_Game
//
//  Created by Rita Frias on 10/7/22.
//
//This is where we have the backend

import Foundation

struct MemoryGame<CardIcon>{
    var cards: Array<Card>
    
    func chooseCard(_ card: Card) {//external name, internal name,
        
    }
    
    struct Card {//This is technically MemoryGame.Card since it is inside another struct
        var faceUp: Bool
        var isMatch: Bool
        var icon: CardIcon
    }
}
