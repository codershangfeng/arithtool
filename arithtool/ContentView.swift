//
//  ContentView.swift
//  arithtool
//
//  Created by sam on 2022/7/16.
//

import SwiftUI

struct ContentView: View {
    var genQuizzesFunc: (() -> [quiz]) =  { return [] }
    @State private var quizzes: [quiz] = []
    @State private var showResult: Bool = false

    var body: some View {
        VStack {
            Spacer()
            HStack(alignment: .center) {
                if quizzes.count == 0 {
                    EquationView(leftOperandText: "?", rightOperandText: "?", operatorText: "+/-", resultText: "?")
                } else {
                    VStack(alignment: .center) {
                        ForEach(quizzes) { quiz in
                            if showResult {
                                EquationView(leftOperandText: "\(quiz.leftOperand)", rightOperandText: "\(quiz.rightOperand)", operatorText: quiz.op , resultText: "\(quiz.sum())")
                                    .padding()
                            } else {
                                EquationView(leftOperandText: "\(quiz.leftOperand)", rightOperandText: "\(quiz.rightOperand)", operatorText: quiz.op , resultText: "?")
                                    .padding()
                            }
                        }
                    }
                }
            }
            Spacer()
            Divider()
            HStack {
                Spacer()
                Button("Generate") {
                    quizzes = self.genQuizzesFunc()
                    showResult = false
                }.background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(5)
                    .padding()
                Spacer()
                Button("Reveal") {
                    showResult = true
                }.disabled(quizzes.count == 0 || showResult == true)
                    .background(Color.red)
                    .foregroundColor(Color.white)
                    .cornerRadius(5)
                    .padding()
                Spacer()
            }
            Spacer()
        }
    }
}

struct EquationView: View {
    var leftOperandText: String = ""
    var rightOperandText: String = ""
    var operatorText: String = ""
    var resultText: String = ""

    var body: some View {
        HStack {
            Text(leftOperandText)
            Text(operatorText)
            Text(rightOperandText)
            Text("=")
            Text(resultText)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

