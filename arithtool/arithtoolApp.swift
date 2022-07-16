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
            ContentView(genQuizzesFunc: genQuizzes)
        }
    }
}

struct quiz: Identifiable {
    let id = UUID()
    var leftOperand: Int
    var op: String
    var rightOperand: Int
    
    func sum() -> Int {
        switch self.op {
        case "+":
            return self.leftOperand + self.rightOperand
        case "-":
            return self.leftOperand - self.rightOperand
        default:
            return -1
        }
    }
    
    func equation() -> String {
        return "\(self.leftOperand) \(self.op) \(self.rightOperand) = \(self.sum())"
    }
    
    func question() -> String {
        return "\(self.leftOperand) \(self.op) \(self.rightOperand) = ?"
    }
}

func genQuizzes() -> [quiz] {
    var quizzes: [quiz] = []
    
    while quizzes.count <= 4 {
        let left = Int.random(in: 1...999)
        let right = Int.random(in: 1...999)
        
        let sum = left + right
        let difference = left - right
        if sum < 1000 {
            quizzes.append(quiz(leftOperand: left, op: "+", rightOperand: right))
        } else if difference > 0 && difference > 0 {
            quizzes.append(quiz(leftOperand: left, op: "-", rightOperand: right))
        }
    }

    return quizzes
}

