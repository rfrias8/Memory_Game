//
//  MemoryGame_Model.swift
//  Memory_Game
//
//  Created by Rita Frias on 10/7/22.
//
//This is where we have the backend

import Foundation

struct MemoryGame<CardIcon> where CardIcon: Equatable{
    private(set) var cards: Array<Card>
    
    private var indexOfTheOnlyFaceUpCard: Int?
    
    mutating func chooseCard(_ card: Card) {//external name, internal name,
        if let chosenIndex = index(of: card),
            !cards[chosenIndex].faceUp,
            !cards[chosenIndex].isMatch {
            if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {
                if cards[chosenIndex].icon == cards[potentialMatchIndex].icon{
                    cards[chosenIndex].isMatch = true
                    cards[potentialMatchIndex].isMatch = true
                }
                indexOfTheOnlyFaceUpCard = nil
            } else {
                for index in 0..<cards.count {
                    cards[index].faceUp = false
                }
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].faceUp.toggle()
        }
        
        print("\(cards)")
    }
    
    mutating func shuffle() {
        cards.shuffle()
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }
    
    init(cardPairsCount: Int, createCardContent: (Int) -> CardIcon) {
        cards = Array<Card>()
        //This for loop will take the num of cards and multiply by 2 and add them to the array
        for indexOfPair in 0..<cardPairsCount {
            let content: CardIcon = createCardContent(indexOfPair)
            cards.append(Card(id:indexOfPair * 2, icon:content))
            cards.append(Card(id:indexOfPair * 2+1, icon:content))
        }
        cards.shuffle()
    }
    
    struct Card: Identifiable{
        var id: Int
        //This is technically MemoryGame.Card since it is inside another struct
        var faceUp: Bool = false
        var isMatch: Bool = false
        var icon: CardIcon
    }
}
