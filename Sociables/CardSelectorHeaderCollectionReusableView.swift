//
//  CardSelectorHeaderCollectionReusableView.swift
//  Sociables
//
//  Created by Taylor Ledingham on 2015-09-30.
//  Copyright © 2015 Taylor Ledingham. All rights reserved.
//

import UIKit

class CardSelectorHeaderCollectionReusableView: UICollectionReusableView {
        
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    var cardSelectionCountdownValue = 0;
    
    func reduceCountDownLabel() {
        cardSelectionCountdownValue--;
        countdownLabel.text = "\(cardSelectionCountdownValue) left"
    }
    
    func increaseCountDownLabel() {
        cardSelectionCountdownValue++;
        countdownLabel.text = "\(cardSelectionCountdownValue) left"
    }
}
