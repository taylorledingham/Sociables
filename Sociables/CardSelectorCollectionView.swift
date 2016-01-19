//
//  CardSelectorCollectionView.swift
//  Sociables
//
//  Created by Taylor Ledingham on 2015-09-21.
//  Copyright © 2015 Taylor Ledingham. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"
private let addReuseIdentifier = "AddCell"

class CardSelectorCollectionView: UICollectionViewController {
    
    struct Constants {
        static let kNumberOfRequiredCards = 13
    }
    
    var cards : [CardChallenge] = []
    var cardSelectorheaderView : CardSelectorHeaderCollectionReusableView?
    var cardSelectorFooterView : CardSelectorFooterCollectionReusableView?
    var numberOfSelectedCards : Int = 0


    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.collectionView?.allowsMultipleSelection = true
        self.setUpDefaultCardCallenges()
        self.collectionView?.remembersLastFocusedIndexPath = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setUpDefaultCardCallenges() {
        
        self.cards = CardChallenge.setUpInitialCards()
        
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cards.count + 1
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = UICollectionViewCell.init()
        if (indexPath.row == self.cards.count) {
            cell = collectionView.dequeueReusableCellWithReuseIdentifier(addReuseIdentifier, forIndexPath: indexPath)
        } else {
            let cardCell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CardChallengeCollectionViewCell
            let cardChallenge = self.cards[indexPath.row]
            cardCell.setCardTitleAndDescription(cardChallenge.challengeName, description: cardChallenge.challengeShortDescription)
            return cardCell
        }
    
        return cell
    }
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        
    }
    
    override func collectionView(collectionView: UICollectionView, canFocusItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
    }
    
    override func collectionView(collectionView: UICollectionView, shouldUpdateFocusInContext context: UICollectionViewFocusUpdateContext) -> Bool {
        return true
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if let cell : CardChallengeCollectionViewCell = self.collectionView?.cellForItemAtIndexPath(indexPath) as? CardChallengeCollectionViewCell {
            if indexPath.row == self.cards.count {
                
            } else {
                let card = self.cards[indexPath.row]
                if let cardSelectorheaderView = cardSelectorheaderView where self.numberOfSelectedCards <= Constants.kNumberOfRequiredCards  {
                    card.isSelected = !card.isSelected
                    self.numberOfSelectedCards++
                    cardSelectorheaderView.reduceCountDownLabel()
                    cell.changeUIForSelectedCard()
                }
                
                if (numberOfSelectedCards == Constants.kNumberOfRequiredCards) {
                    self.cardSelectorFooterView?.playGameButton.enabled = true
                }
            }
        }
    }
    
    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        if let cell : CardChallengeCollectionViewCell = self.collectionView?.cellForItemAtIndexPath(indexPath) as? CardChallengeCollectionViewCell {
            if indexPath.row == self.cards.count {
                
            } else {
            let card = self.cards[indexPath.row]
            card.isSelected = !card.isSelected
            self.numberOfSelectedCards--
            if let cardSelectorheaderView = cardSelectorheaderView {
                cardSelectorheaderView.increaseCountDownLabel()
                cell.changeUIForUnselectedCard()
            }
            
            
            if (numberOfSelectedCards < Constants.kNumberOfRequiredCards) {
                self.cardSelectorFooterView?.playGameButton.enabled = false
            }
        }
        }
    }
    
    override func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        let reusableView : UICollectionReusableView = UICollectionReusableView.init();
        if (kind == UICollectionElementKindSectionHeader) {
           let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "HeaderView", forIndexPath: indexPath) as! CardSelectorHeaderCollectionReusableView;
            headerView.cardSelectionCountdownValue = Constants.kNumberOfRequiredCards;
            cardSelectorheaderView = headerView
            return headerView;
        } else if (kind == UICollectionElementKindSectionFooter) {
            let footerView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "FooterView", forIndexPath: indexPath) as! CardSelectorFooterCollectionReusableView;
            footerView.playGameButton.enabled = false;
            cardSelectorFooterView = footerView
            return footerView;
        }
        
        return reusableView;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "playGame") {
            let gameVC = (segue.destinationViewController as! GameViewController)
            gameVC.numberOfPlayers = 4
            gameVC.cardRules = self.cards
            
        }
    }
    

   }
