//
//  ContentView.swift
//  SwiftUI&UIKit
//
//  Created by Perejro on 04/01/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var targetValue = 0;
    @State private var currentValue: Float = 0;
    @State private var opacity: Double = 0;
    @State private var isAlertPresented = false;
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Подвинь слайдер, как можно ближе к:")
                + Text(" \(targetValue)")
                    .fontWeight(.bold)
            
            SliderViewRepresentation(value: $currentValue, opacity: $opacity)
                .onChange(of: currentValue) { _, newValue in
                    let score  = computeScore()
                    opacity = Double(score) / 100
                }
            
            Button("Проверь меня") {
                isAlertPresented = true
            }
            .buttonStyle(.borderedProminent)
            .tint(.blue)
            .fontWeight(.bold)
            
            Button("Начать заново") {
                makeInitialState()
            }
            .buttonStyle(.borderedProminent)
            .tint(.black)
            .foregroundColor(.white)
            .fontWeight(.bold)
                
        }
        .padding()
        .alert(isPresented: $isAlertPresented) {
            Alert(
                title: Text("Ваш результат"),
                message: Text(computeScore().formatted())
            )
        }
        .onAppear {
            makeInitialState()
        }
    }
    
    private func makeInitialState() {
        targetValue = Int.random(in: 0...100)
        currentValue = Float.random(in: 0...100)
    }
    
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(currentValue)))
        return 100 - difference
    }
}

#Preview {
    ContentView()
}
