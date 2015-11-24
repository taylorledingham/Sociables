//
//  Game.swift
//  Sociables
//
//  Created by Taylor Ledingham on 2015-10-09.
//  Copyright © 2015 Taylor Ledingham. All rights reserved.
//

import UIKit
import GameplayKit

struct CardDeck {
    var value : CardValue
    let cardImage : UIImage
    var suit : CardSuit
    
    init (value : CardValue, suit : CardSuit) {
        self.value = value
        self.suit = suit
        let imageName = "2_clubs" //"\(value)_\(suit)"
        self.cardImage = UIImage(named: imageName)!
    }
}

class Game: NSObject {
    
        
    let numberOfPlayers : Int
    let cardRules : [CardChallenge]
    var currentCard : CardDeck
    var currentIndex : Int
    let cardDeck : [CardDeck]
    
    
    init (numberOfPlayers : Int, cards : [CardChallenge]) {
        
        self.numberOfPlayers = numberOfPlayers
        self.cardRules = cards;
        self.cardDeck = Game.generateCardValues()
        self.currentCard = self.cardDeck.first!
        self.currentIndex = 0
    }
    
    static func generateCardValues() -> [CardDeck] {
        var newCardDeck : [CardDeck] = []
        for (var i=1; i <= 16; i++) {
            //get the value at i cl
            let val = CardValue(rawValue: i)
            if let val = val {
            newCardDeck.append(CardDeck.init(value: val, suit: CardSuit.hearts))
            newCardDeck.append(CardDeck.init(value: val, suit: CardSuit.clubs))
            newCardDeck.append(CardDeck.init(value: val, suit: CardSuit.diamonds))
            newCardDeck.append(CardDeck.init(value: val, suit: CardSuit.spades))
            }
            
        }
        
        let shuffled = newShuffledArray(newCardDeck)
        
        return newCardDeck//shuffled
    }
    
   static func newShuffledArray(array:[CardDeck]) -> [CardDeck] {
        //var newArray = array as NSArray
    var mutableArray : [CardDeck] = []
        let count = mutableArray.count
        if count>1 {
            for var i=count-1;i>0;--i{
                let cardDeck = array[i] as CardDeck
                mutableArray.insert(cardDeck, atIndex: Int(arc4random_uniform(UInt32(i+1))))
            }
        }
        return mutableArray
    }
    
    static func getRandomCardChallenges() -> [CardChallenge] {
        let cardChallenges = CardChallenge.setUpInitialCards()
        var newChallenges : [CardChallenge] = []
        
        var i = 0
        while (newChallenges.count <= 13) {
            var randomIndex = Int(0 + random() % (cardChallenges.count-1))
            let card = cardChallenges[randomIndex]
            if (!newChallenges.contains(card)){
                newChallenges.insert(card, atIndex: i)
                i++
            }
        }
        
        return newChallenges
    }
}
