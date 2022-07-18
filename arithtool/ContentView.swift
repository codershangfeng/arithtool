//
//  ContentView.swift
//  arithtool
//
//  Created by sam on 2022/7/16.
//

import SwiftUI

struct ContentView: View {
    var genQuizzesFunc: ((Mode) -> [expression]) =  { _ in return [] }
    @State private var additionAndSubstractionExps: [expression] = []
    @State private var divisionExps: [expression] = []
    @State private var showResult: Bool = false

    var body: some View {
        VStack {
            Spacer()
            HStack() {
                Spacer()
                VStack() {
                    if additionAndSubstractionExps.count == 0 {
                        EquationView(leftOperandText: "?", rightOperandText: "?", operatorText: "+ or -", resultText: "?")
                    } else {
                        VStack(alignment: .center) {
                            ForEach(additionAndSubstractionExps) { exp in
                                if showResult {
                                    EquationView(leftOperandText: "\(exp.leftOperand)", rightOperandText: "\(exp.rightOperand)", operatorText: exp.op , resultText: "\(exp.total())")
                                        .padding()
                                } else {
                                    EquationView(leftOperandText: "\(exp.leftOperand)", rightOperandText: "\(exp.rightOperand)", operatorText: exp.op , resultText: "?")
                                        .padding()
                                }
                            }
                        }
                    }
                }
                Spacer()
                Divider()
                Spacer()
                VStack() {
                    if divisionExps.count == 0 {
                        EquationView(leftOperandText: "?", rightOperandText: "?", operatorText: "÷", resultText: "?")
                    } else {
                        VStack(alignment: .center) {
                            ForEach(divisionExps) { exp in
                                if showResult {
                                    EquationView(leftOperandText: "\(exp.leftOperand)", rightOperandText: "\(exp.rightOperand)", operatorText: "÷" , resultText: "\(exp.quotient()) ······ \(exp.remainder())")
                                        .padding()
                                } else {
                                    EquationView(leftOperandText: "\(exp.leftOperand)", rightOperandText: "\(exp.rightOperand)", operatorText: "÷", resultText: "? ······ ?")
                                        .padding()
                                }
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
                Button(" 答案 ") {
                    showResult = true
                }.disabled(additionAndSubstractionExps.count == 0 || showResult == true)
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
        HStack(alignment: .center) {
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

