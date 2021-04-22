//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Demon Hunter on 04/10/20.
//  Copyright © 2020 Milovan Tomašević. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    var result = "0.0"
    var tip = 10
    var split = 2
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = result
        settingLabel.text = "Split between \(split) people, with \(tip)% tip."

    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }

}
