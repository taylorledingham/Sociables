//
//  CardChallengeCollectionViewCell.swift
//  Sociables
//
//  Created by Taylor Ledingham on 2015-09-21.
//  Copyright © 2015 Taylor Ledingham. All rights reserved.
//

import UIKit

class CardChallengeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var cardTitleLabel: UILabel!
    @IBOutlet weak var cardDescriptionLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBAction func moreButtonWasSelected(sender: AnyObject) {
    }
    @IBOutlet weak var moreInfoButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCardTitleAndDescription(title : String, description : String) {
        self.cardTitleLabel.text = title
        self.cardDescriptionLabel.text = description
    }
    
    func changeUIForSelectedCard() {
        self.backgroundImageView.image = UIImage(named: "cellBackground");
    }
    
    func changeUIForUnselectedCard() {
        self.backgroundImageView.image = UIImage(named: "defaultCell");
        backgroundImageView.adjustsImageWhenAncestorFocused = true
    }
    
}
