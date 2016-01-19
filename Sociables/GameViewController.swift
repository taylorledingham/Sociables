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
    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var cardDescLabel: UILabel!
    
    func setUpGame () {
        if let rules = cardRules {
            game = Game.init(numberOfPlayers: numberOfPlayers!, cards: rules)
        } else {
            self.setUpQuickStartGame()
        }
    }
    
    private func setUpQuickStartGame() {
        numberOfPlayers = 0
        cardRules = Game.getRandomCardChallenges()
}

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpGame()
        deckCardButton.imageView?.adjustsImageWhenAncestorFocused = true
        deckCardButton.clipsToBounds = false
       // currentCardButton.clipsToBounds = false
       // currentCardButton.imageView?.adjustsImageWhenAncestorFocused = true

}
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (numberOfPlayers == 0) {
            let numberOfPlayersAlert = UIAlertController.init(title: "Number of Playera", message: "Please Enter the Number of Players that will be Playing", preferredStyle: UIAlertControllerStyle.Alert)
            numberOfPlayersAlert.addTextFieldWithConfigurationHandler { textField in
                textField.keyboardType = .NumberPad
                textField.placeholder = NSLocalizedString("Number of Players", comment: "")
            }
            let acceptAction = UIAlertAction(title: "Save", style: .Default) {[unowned numberOfPlayersAlert] _ in
                if let enteredText = numberOfPlayersAlert.textFields?.first?.text {
                    self.numberOfPlayers = Int(enteredText)
                    self.game = Game.init(numberOfPlayers: self.numberOfPlayers!, cards: self.cardRules!)
                }
            }
            numberOfPlayersAlert.addAction(acceptAction)
            presentViewController(numberOfPlayersAlert, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cardDeckSelected(sender: AnyObject) {
        if (game?.currentIndex >= 51) {
           let alert = UIAlertController(title: "Game is Finished", message: "Would you like to play again", preferredStyle: .Alert)
            let playAgainAction = UIAlertAction(title: "Play Again", style: .Default, handler: { (UIAlertAction) -> Void in
                
            });
            let returnAction = UIAlertAction(title: "Return to Main", style: .Default, handler: { (UIAlertAction) -> Void in
                
            });
            alert.addAction(playAgainAction)
            alert.addAction(returnAction)
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
        game?.currentIndex++
        game?.currentCard = (game?.cardDeck[(game?.currentIndex)!])!
        currentCardButton.setImage(game?.currentCard.cardImage, forState: .Normal)
            if let currentCardChallenge = game?.getCardChallenge((game?.currentCard.value)!) {
            cardDescLabel.text = currentCardChallenge.challengeFullDescription
            cardTitleLabel.text = currentCardChallenge.challengeName
            }
            
        }
    }

    @IBOutlet weak var currentCardSelected: UIButton!


}
