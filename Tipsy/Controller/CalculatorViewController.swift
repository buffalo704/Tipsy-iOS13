//
//  TurkeyViewController.swift
//  Tipsy
//
//  Created by Sidney So on 10/15/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorBrain = CalculatorBrain(amount: 0.00, tip: 0.1, people: 2, splitAmount: 0.00)
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        if zeroPctButton.isSelected {
            calculatorBrain.tip = 0.0
        }
        if tenPctButton.isSelected {
            calculatorBrain.tip = 0.1
        }
        if twentyPctButton.isSelected {
            calculatorBrain.tip = 0.2
        }
        
    }
    
    
        
    @IBAction func abc(_ sender: UITextField) {
        print(sender.text!)
        calculatorBrain.amount = Float(sender.text!) ?? 0.00
    }
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value )

        calculatorBrain.people = Int(sender.value)
    }
        
    @IBAction func calculatePressed(_ sender: UIButton) {
        calculatorBrain.calculateSplit(
            amount: calculatorBrain.amount,
            tip: calculatorBrain.tip,
            split: calculatorBrain.people)

        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToResult" {
                let destinationVC = segue.destination as! ResultsViewController
                destinationVC.amount = calculatorBrain.getAmountValue()
                destinationVC.tip = calculatorBrain.getTipValue()
                destinationVC.split = calculatorBrain.getSplitValue()
                destinationVC.splitAmount = calculatorBrain.getSplitAmount()
                
                print("\(calculatorBrain.getSplitValue()) ovw")
            }
        }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
