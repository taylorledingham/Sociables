//
//  CardChallenge.swift
//  Sociables
//
//  Created by Taylor Ledingham on 2015-09-21.
//  Copyright © 2015 Taylor Ledingham. All rights reserved.
//

import UIKit

enum CardValue: Int {
    case none = -1
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
    
    func  CardValue(val : Int) {
        return CardValue(val)
    }
    
}

enum CardSuit : String {
    case clubs = "clubs"
    case hearts = "hearts"
    case diamonds = "diamonds"
    case spades = "spades"
}

struct card {
    

    
    var value : CardValue
    let cardImage : UIImage
    var suit : CardSuit
    
    init (value : CardValue, suit : CardSuit) {
        self.value = value
        self.suit = suit
        let imageString = "2_clubs"//"\(value)_\(suit)"
        self.cardImage = UIImage(named: imageString)!
    }
}

class CardChallenge: NSObject {

    let challengeName : String
    let challengeShortDescription : String
    let challengeFullDescription : String
    var cardValue : card
    var isSelected : Bool = false
    
    override init(){
        challengeName = "SOCIABLES"
        challengeShortDescription = "Let's play"
        challengeFullDescription = ""
        cardValue = card.init(value: CardValue.Ace, suit: CardSuit.clubs)
        super.init()
    }
    
    init(name : String, shortDesc : String, longDesc : String) {
        challengeName = name
        challengeShortDescription = shortDesc
        challengeFullDescription = longDesc
        cardValue = card.init(value: CardValue.Ace, suit: CardSuit.clubs)
        
    }
    
    class func setUpInitialCards() -> [CardChallenge] {
        
        var cardArray = [CardChallenge]()
        
        let boxHead = CardChallenge.init(name: "Box Head", shortDesc : "Put an empty box on your head until another box card is drawn", longDesc: "Put an empty box on your head until another player draws a Box Head card, or until another rule cancels it");
        let buddySystem = CardChallenge.init(name: "Buddy System", shortDesc : "You drink, your buddy drinks", longDesc: "Pick a buddy. When one drinks, so does their buddy until the next buddy system card is drawn");
        let categories = CardChallenge.init(name: "Categories", shortDesc : "Select a category and keep naming until someone fails", longDesc: "Selects a category (for example, “brands of beer”). All players go around the circle naming items that are from that category. The first player to fail to name an item must drink.");
        let kingsCup = CardChallenge.init(name: "King's Cup", shortDesc : "Pour a little of your drink in the King's Cup, last one drinks it all!", longDesc: "Place an empty cup in the center of the circle. Any time this card (traditionally the King) is drawn, the drawer pours some of their own drink into the center cup. When the fourth card is drawn, that player must chug the contents of the center cup.");
        let ruleCard = CardChallenge.init(name: "Rule card", shortDesc : "Make up a rule", longDesc: "Fill in the blank with a rule of your very own.");
        let ladiesDrink = CardChallenge.init(name: "Ladies Drink", shortDesc : "If you identify as a female, take a drink.", longDesc: "If you identify as a female, take a drink.");
        let menDrink = CardChallenge.init(name: "Men Drink", shortDesc : "If you identify as a male, take a drink.", longDesc: "If you identify as a male, take a drink.");
        let littleGreenMan = CardChallenge.init(name: "Little Green Man", shortDesc : "Drink with your imaginery green friend", longDesc: "You must remove an imaginary little man from your cup every time you drink, and put him back after. If another player catches you failing to do so, you must drink again.");
        let moose = CardChallenge.init(name: "Moose", shortDesc : "Everyone make moose antlers on head, last one drinks!", longDesc: "As soon as this card is drawn, all players must immediately place their thumbs to their forehead with fingers spread, resembling antlers. The last player to do this must drink.");
        let neverHaveIEver = CardChallenge.init(name: "Never Have I Ever", shortDesc : "Everyone gets three fingers, first one down all fingers has to drink.", longDesc: "All players raise three fingers. Starting with the player who drew the card, go around the circle confessing something that you have never done. Eg. “Never have I ever … rode a bike.” If a player HAS done something that’s been said, they must lower one finger.When at least one player has all three fingers down, the round ends, and all players must drink as many times as fingers they have lowered.");
        
         let questionMaster = CardChallenge.init(name: "Question Master", shortDesc : "You draw this card, anytime you ask another player a question, they drink. They call you out, you drink.", longDesc: "You are now the “Question Master”. Any time you ask another player a question, if that player answers it, they must drink.");
        
        let rhymeTime = CardChallenge.init(name: "Rhyme Time", shortDesc : "Choose a work, keep rhyming in order. First one that messes up, drinks!", longDesc: "Choose a word. Starting to the left, all players go around the circle saying words that rhyme with the original. No word can be said twice. The first player to fail to say a word or who says a word that doesn’t rhyme must take a drink.");
        let socialbles = CardChallenge.init(name: "SOCIALBLES", shortDesc : "EVERYONE DRINKS", longDesc: "EVERYONE DRINKS");
        let thumbCard = CardChallenge.init(name: "Thumb Card", shortDesc : "Use this card at anytime by placing your thumb on the table. Last one to catch on, drinks!", longDesc: "You are now the “Thumb Master”. Any time you place your thumb on the table, every other player must immediately place their thumb on the table as well. The last person to do so must take a drink. This can be done repeatedly until another thumb card is drawn.");
        
        cardArray = [boxHead, buddySystem, categories, kingsCup, ruleCard, ladiesDrink, menDrink, littleGreenMan, moose, neverHaveIEver, questionMaster, rhymeTime, socialbles, thumbCard]
        
        
        
        return cardArray
        
    }
    
    
}
