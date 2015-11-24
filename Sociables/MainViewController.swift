//
//  MainViewController.swift
//  Sociables
//
//  Created by Taylor Ledingham on 2015-11-09.
//  Copyright © 2015 Taylor Ledingham. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBAction func quickStartGameAction(sender: AnyObject) {
        let gameStoryboard = UIStoryboard.init(name: "Game", bundle: NSBundle.mainBundle())
        let gameVC = gameStoryboard.instantiateViewControllerWithIdentifier("gameVC")
        self.presentViewController(gameVC, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "playQuickGame") {
            let gameVC = segue.destinationViewController as! GameViewController;
            gameVC.setUpGame()
        } else if (segue.identifier == "makeGame") {
            
        }
    }

}
