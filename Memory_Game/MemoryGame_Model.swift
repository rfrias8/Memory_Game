//
//  MemoryGame_Model.swift
//  Memory_Game
//
//  Created by Rita Frias on 10/7/22.
//
//This is where we have the backend

import Foundation

struct MemoryGame<CardIcon>{
    private(set) var cards: Array<Card>
    
    func chooseCard(_ card: Card) {//external name, internal name,
        
    }
    
    init(cardPairsCount: Int, createCardContent: (Int) -> CardIcon) {
        cards = Array<Card>()
        //This for loop will take the num of cards and multiply by 2 and add them to the array
        for indexOfPair in 0..<cardPairsCount {
            let content: CardIcon = createCardContent(indexOfPair)
            cards.append(Card(icon:content))
            cards.append(Card(icon:content))
        }
    }
    
    struct Card {//This is technically MemoryGame.Card since it is inside another struct
        var faceUp: Bool = false
        var isMatch: Bool = false
        var icon: CardIcon
    }
}
