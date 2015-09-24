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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setCardTitleAndDescription(title : String, description : String) {
        self.cardTitleLabel.text = title
        self.cardDescriptionLabel.text = description
    }
    
}
