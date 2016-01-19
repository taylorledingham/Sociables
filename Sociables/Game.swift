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
        let imageName = "\(value.simpleDescription())_\(suit)"
        self.cardImage = UIImage(named: imageName)!
    }
}

extension CollectionType {
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    mutating func shuffleInPlace() {
        if count < 2 {
            return
        }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
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
        self.cardDeck = Game.generateDeckOfCards()
        self.currentCard = self.cardDeck.first!
        self.currentIndex = 0
    }
    
    static func generateDeckOfCards() -> [CardDeck] {
        var newCardDeck : [CardDeck] = []
        for i in 0..<17 {
            let val = CardValue(rawValue: i)
            if let val = val {
            newCardDeck.append(CardDeck.init(value: val, suit: CardSuit.hearts))
            newCardDeck.append(CardDeck.init(value: val, suit: CardSuit.clubs))
            newCardDeck.append(CardDeck.init(value: val, suit: CardSuit.diamonds))
            newCardDeck.append(CardDeck.init(value: val, suit: CardSuit.spades))
            }
        }
        
        let shuffled = newCardDeck.shuffle()//newShuffledArray(newCardDeck)
        
        return shuffled
    }
    
    func getCardChallenge(value : CardValue) -> CardChallenge? {
        
        let values = cardRules.filter { (challenge : CardChallenge) -> Bool in
            return challenge.cardValue == value
        }
        
        return values.first
    }
    
    static func getRandomCardChallenges() -> [CardChallenge] {
        let cardChallenges = CardChallenge.setUpInitialCards()
        var newChallenges : [CardChallenge] = []
        
        var cardValues = CardValue.allValues.shuffle()
       // newShuffledArray(cardValues)
        
        var i = 0
        while (newChallenges.count < 13) {
            let randomIndex = Int(0 + random() % (cardChallenges.count-1))
            let card = cardChallenges[randomIndex]
            if (!newChallenges.contains(card)) {
                card.cardValue = cardValues[i]
                newChallenges.insert(card, atIndex: i)
                i++
            }
        }
        
        return newChallenges
    }
}
