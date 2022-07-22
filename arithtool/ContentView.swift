//
//  ContentView.swift
//  arithtool
//
//  Created by sam on 2022/7/16.
//

import SwiftUI

struct ContentView: View {
    var genQuizzesFunc: ((Mode) -> [expression]) = { _ in return [] }
    @State private var additionAndSubstractionExps: [expression] = []
    @State private var divisionExps: [expression] = []
    @State private var showResult: Bool = false

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                VStack {
                    if additionAndSubstractionExps.count == 0 {
                        EquationView(leftOperandText: "?", rightOperandText: "?", operatorText: "+ or -", answerText: nil, maskText: "?")
                    } else {
                        VStack(alignment: .center) {
                            ForEach(additionAndSubstractionExps) { exp in
                                EquationView(leftOperandText: "\(exp.leftOperand)", rightOperandText: "\(exp.rightOperand)", operatorText: exp.op, answerText: "\(exp.total())", maskText: "?")
                                    .padding()
                            }
                        }
                    }
                }
                Spacer()
                Divider()
                Spacer()
                VStack {
                    if divisionExps.count == 0 {
                        EquationView(leftOperandText: "?", rightOperandText: "?", operatorText: "÷", answerText: nil, maskText: "?")
                    } else {
                        VStack(alignment: .center) {
                            ForEach(divisionExps) { exp in
                                EquationView(leftOperandText: "\(exp.leftOperand)", rightOperandText: "\(exp.rightOperand)", operatorText: "÷", answerText: "\(exp.quotient()) ······ \(exp.remainder())", maskText: "? ······ ?")
                                    .padding()
                            }
                        }
                    }
                }
                Spacer()
            }
            Spacer()
            Divider()
            HStack {
                Spacer()
                Button(" 生成 ") {
                    additionAndSubstractionExps = self.genQuizzesFunc(.additionAndSubstraction)
                    divisionExps = self.genQuizzesFunc(.division)
                    showResult = false
                }.background(Color.blue)
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
    var answerText: String?
    var maskText: String = ""
    @State private var showAnswer: Bool = false

    var body: some View {
        HStack(alignment: .center) {
            Text(leftOperandText)
            Text(operatorText)
            Text(rightOperandText)
            Text("=")
            if showAnswer && answerText != nil {
                Text(answerText!)
            } else {
                Text(maskText)
            }
            if answerText != nil {
                Button(" 答案 ") {
                    showAnswer = true
                }.disabled(showAnswer == true)
                    .background(Color.green)
                    .foregroundColor(Color.white)
                    .cornerRadius(5)
                    .padding()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
