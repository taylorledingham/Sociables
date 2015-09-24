//
//  CardChallenge.swift
//  Sociables
//
//  Created by Taylor Ledingham on 2015-09-21.
//  Copyright © 2015 Taylor Ledingham. All rights reserved.
//

import UIKit

class CardChallenge: NSObject {
    enum cardValue: Int {
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
    }

    let challengeName : String
    let challengeDescription : String
    var challengeCardValue : cardValue
    
    override init(){
        challengeName = "SOCIABLES"
        challengeDescription = "Let's play"
        challengeCardValue = cardValue.Ace
        super.init()
    }
    
}
