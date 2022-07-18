//
//  arithtoolApp.swift
//  arithtool
//
//  Created by sam on 2022/7/16.
//

import SwiftUI

@main
struct arithtoolApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(genQuizzesFunc: genExpressions)
        }
    }
}

struct expression: Identifiable {
    let id = UUID()
    var leftOperand: Int
    var op: String
    var rightOperand: Int
    
    func total() -> Int {
        switch self.op {
        case "+":
            return self.leftOperand + self.rightOperand
        case "-":
            return self.leftOperand - self.rightOperand
        default:
            return -1
        }
    }
    
    func quotient() -> Int {
        return self.leftOperand / self.rightOperand
    }
    
    func remainder() -> Int {
        return self.leftOperand % self.rightOperand
    }
}

func genExpressions(mode: Mode) -> [expression] {
    var exps: [expression] = []
    let cnt = 4
    switch mode {
    case .additionAndSubstraction:
        while exps.count <= cnt {
            let left = Int.random(in: 100...999)
            let right = Int.random(in: 100...999)

            let sum = left + right
            let difference = left - right
            if sum < 1000 {
                exps.append(expression(leftOperand: left, op: "+", rightOperand: right))
            } else if difference > 0 && difference > 0 {
                exps.append(expression(leftOperand: left, op: "-", rightOperand: right))
            }
        }
    case .division:
        while exps.count <= cnt {
            let divisor = Int.random(in: 3...9)
            var reminder = 10
            while reminder >= divisor {
                reminder = Int.random(in: 2...9)
            }
            let dividend = divisor * Int.random(in: 1...9) + reminder

            exps.append(expression(leftOperand: dividend, op: "/", rightOperand: divisor))
        }
    }

    return exps
}

enum Mode {
    case additionAndSubstraction
    case division
}
