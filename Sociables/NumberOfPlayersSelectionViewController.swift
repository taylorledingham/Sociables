//
//  NumberOfPlayersSelectionViewController.swift
//  Sociables
//
//  Created by Taylor Ledingham on 2015-09-30.
//  Copyright © 2015 Taylor Ledingham. All rights reserved.
//

import UIKit

class NumberOfPlayersSelectionViewController: UIViewController {
    @IBOutlet weak var numberOfPlayersTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "cardSelector") {
            if let numOfPlayers = NSInteger(numberOfPlayersTextField.text!) {
                [NSUserDefaults .standardUserDefaults() .setInteger(numOfPlayers, forKey: "numOfPlayers")]
            }
            
        }
    }
    
}
