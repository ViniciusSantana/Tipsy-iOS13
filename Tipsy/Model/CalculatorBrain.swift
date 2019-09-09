//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Vinicius Santana on 10/06/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct CalculatorBrain {
       var total : Float?
       var tip : Float = 0.1
       var splitNumber : Float = 2
    
    
    mutating func calculate(totalAmout : Float) {
        total = (totalAmout + (totalAmout*tip))/splitNumber
    }
    
    func getValuePerPerson() -> Float {
        return  total ?? 0
    }
    
    func getTip() -> Float {
        return tip
    }
    
    
    func getSplitNumber() -> Float {
        return splitNumber
    }
    
}
