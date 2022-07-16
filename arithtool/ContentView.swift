//
//  ContentView.swift
//  arithtool
//
//  Created by sam on 2022/7/16.
//

import SwiftUI

struct ContentView: View {
    var genQuizzesFunc: (() -> [quiz])?
    @State private var quiz: quiz?
    @State private var equationText: String = ""

    var body: some View {
        VStack {
            HStack {
                Text(equationText)
            }
            HStack {
                HStack {
                    Button("Generate") {
                        quiz = self.genQuizzesFunc!()[0]
                        equationText = quiz?.question() ?? "Opps, error!"
                    }
                    Button("Reveal") {
                        equationText = quiz?.equation() ?? "Opps, error!"
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

