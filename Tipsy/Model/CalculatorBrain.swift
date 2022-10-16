//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Sidney So on 10/15/21.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    var bill: Bill?
    
    var amount: Float
    var tip: Float
    var people: Int
    
    var splitAmount: Float
    
    func getAmountValue() -> String {
        let tipToDecimal = String(format: "%.2f", amount)
        return tipToDecimal
    }
    
    func getTipValue() -> String {
        let tipToDecimal = String(format: "%.2f", tip)
        return tipToDecimal
    }
    
    func getSplitValue() -> String {
        print("\(people) are people")
        return String(people)
    }
    
    func getSplitAmount() -> String {
        return String(format: "%.2f", splitAmount)
    }
    
    mutating func calculateSplit(amount: Float, tip: Float, split: Int) {
        splitAmount = Float(amount + (amount * tip)) / Float(split)
    }
}
