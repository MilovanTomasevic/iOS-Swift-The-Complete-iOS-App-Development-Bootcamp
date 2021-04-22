//
//  CalculateViewController.swift
//  BMI Calculator
//
//  Created by Milovan Tomašević on 21/08/2020.
//  Copyright © 2020 Milovan Tomašević. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain()

    @IBOutlet weak var heightValueLabel: UILabel!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightValueLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightSlider.value = 100
        
        // Do any additional setup after loading the view.
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        let currentHeightValue = String(format: "%.2f", sender.value)
        heightValueLabel.text = "\(currentHeightValue)m"
    }
    
    
    @IBAction func weightSliderChanged(_ sender: UISlider) {
        let currentWeightValue = Int(sender.value)
        weightValueLabel.text = "\(currentWeightValue)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton){
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight:weight)
        
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.bmiValue = calculatorBrain.getBMIValue()
            destinationVC.advice = calculatorBrain.getAdvice()
            destinationVC.color = calculatorBrain.getColor()
        }
    }
    
}

