//
//  CalcModel.swift
//  Calculator
//
//  Created by Madina Amantayeva on 04.02.2021.
//

import Foundation

enum Operation{
    case constant(Double)
    case unaryOperation((Double)->Double)
    case binaryOperation((Double, Double)->Double)
    case equals
}

struct CalculatorModel {
    var my_operation: Dictionary<String,Operation> =
    [
        "π": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unaryOperation(sqrt),
        "+": Operation.binaryOperation({$0+$1}),
        "-": Operation.binaryOperation({$0-$1}),
        "*": Operation.binaryOperation({$0*$1}),
        "/": Operation.binaryOperation({$0/$1}),
        "±": Operation.unaryOperation({-$0}),
        "=": Operation.equals
    ]
    private var global_value: Double?
    mutating func setOperand(_ operand: Double){
        global_value = operand
    }
    
    mutating func performOperation(_ operation: String){
        let symbol = my_operation[operation]!
        switch symbol {
        case .constant(let value):
            global_value = value
        case .unaryOperation(let function):
            global_value = function(global_value!)
        case .binaryOperation(let function):
            saving = SaveFirstOperandAndOperation(firstOperand: global_value!, operation: function)
        case .equals:
            if global_value != nil{
                global_value = saving?.perfermOperationWith(secondOperand:global_value!)
            }
        }
    }
    
    var result: Double?{
        get{
            return global_value
        }
    }
    private var saving: SaveFirstOperandAndOperation?
    struct SaveFirstOperandAndOperation {
        var firstOperand: Double
        var operation:(Double,Double)->Double
        
        func perfermOperationWith(secondOperand op2: Double) -> Double {
            return operation(firstOperand, op2)
        }
        
    }
}
