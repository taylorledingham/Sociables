//
//  GameViewController.swift
//  Sociables
//
//  Created by Taylor Ledingham on 2015-10-09.
//  Copyright © 2015 Taylor Ledingham. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var numberOfPlayers : Int?
    var cardRules : [CardChallenge]?
    var game : Game?
    

    @IBOutlet weak var deckCardButton: UIButton!
    @IBOutlet weak var currentCardButton: UIButton!
    
    func setUpGame () {
        if let rules = cardRules {
        game = Game.init(numberOfPlayers: numberOfPlayers!, cards: rules)
        } else {
            self.setUpQuickStartGame()
        }
    }
    
    private func setUpQuickStartGame() {
        self.numberOfPlayers = 0
        self.cardRules = Game.getRandomCardChallenges()
}

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpGame()
        
        if (numberOfPlayers == 0) {
            let numberOfPlayersAlert = UIAlertController.init(title: "Number of Playera", message: "Please Enter the Number of Players that will be Playing", preferredStyle: UIAlertControllerStyle.Alert)
            numberOfPlayersAlert.addTextFieldWithConfigurationHandler { textField in
                textField.keyboardType = .NumberPad
                textField.placeholder = NSLocalizedString("Number of Players", comment: "")
            }
            
            let acceptAction = UIAlertAction(title: "Save", style: .Default) {[unowned numberOfPlayersAlert] _ in
                
                if let enteredText = numberOfPlayersAlert.textFields?.first?.text {
                    self.numberOfPlayers = Int(enteredText)
                    
                }
            }
            
            numberOfPlayersAlert.addAction(acceptAction)
            self.presentViewController(numberOfPlayersAlert, animated: true, completion: nil)
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cardDeckSelected(sender: AnyObject) {
        //self.currentCardSelected.setImage(game?.currentCard.cardImage, forState: UIControlState.Normal)
        game?.currentIndex++
        game?.currentCard = (game?.cardDeck[(game?.currentIndex)!])!
    }

    @IBOutlet weak var currentCardSelected: UIButton!


}
