//
//  ContentView.swift
//  SwiftUI&UIKit
//
//  Created by Perejro on 04/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = Int.random(in: 0...100)
    @State private var currentValue: Float = Float.random(in: 0...100)
    @State private var isAlertPresented = false
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Подвинь слайдер, как можно ближе к:")
                + Text(" \(targetValue)")
                    .fontWeight(.bold)
            
            HStack {
                Text("0")
                SliderViewRepresentation(
                    value: $currentValue,
                    opacity: calculateOpacity()
                )
                Text("100")
            }
            
            Button("Проверь меня") {
                isAlertPresented = true
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            
            Button("Начать заново") {
                makeInitialState()
            }
            .buttonStyle(.plain)
        }
        .padding()
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text("Ваш результат"),
                message: Text(computeScore().formatted())
            )
        }
    }
    
    private func makeInitialState() {
        targetValue = Int.random(in: 0...100)
        currentValue = Float.random(in: 0...100)
    }
    
    private func calculateOpacity() -> Double {
        let score  = computeScore()
        return Double(score) / 100
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
