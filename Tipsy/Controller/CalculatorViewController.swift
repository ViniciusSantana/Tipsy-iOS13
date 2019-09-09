//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        clearButtons()
        billTextField.endEditing(true)
        var tip = Float(0)
        if sender.currentTitle == "0%" {
            zeroPctButton.isSelected = true
            tip = 0
        } else  if sender.currentTitle == "10%" {
            tenPctButton.isSelected = true
            tip = 0.1
        }else  if sender.currentTitle == "20%" {
            twentyPctButton.isSelected = true
            tip = 0.2
        }
        
        calculatorBrain.tip = tip
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        calculatorBrain.splitNumber =  Float(sender.value)
    }
    
    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        let billValue = Float(billTextField.text ?? "0.0")!
        calculatorBrain.calculate(totalAmout: billValue)
        self.performSegue(withIdentifier: "goToResult", sender: self)
        
        
    }
    func clearButtons() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller =  segue.destination as! ResultsViewController
        let tip = calculatorBrain.getTip()*100
        controller.splitNumber = calculatorBrain.getSplitNumber()
        controller.tip = tip
        controller.totalPerPerson = calculatorBrain.getValuePerPerson()
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

