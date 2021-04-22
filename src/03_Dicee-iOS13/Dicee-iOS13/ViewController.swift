//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Milovan Tomašević on 11/06/2020.
//  Copyright © 2020 Milovan Tomašević. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // IBOutlet allows me to reference a UI element
    @IBOutlet weak var diceImageView1: UIImageView!
    @IBOutlet weak var diceImageView2: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func roleButtonPressed(_ sender: UIButton) {
        
        let diceArray = [ #imageLiteral(resourceName: "DiceOne"), #imageLiteral(resourceName: "DiceTwo"), #imageLiteral(resourceName: "DiceThree"), #imageLiteral(resourceName: "DiceFour"), #imageLiteral(resourceName: "DiceFive"), #imageLiteral(resourceName: "DiceSix") ]
        
        diceImageView1.image = diceArray.randomElement()
        diceImageView2.image = diceArray.randomElement() // You can also use Int.random(in: 0...5) to replace randomElement()
    }
    


}

