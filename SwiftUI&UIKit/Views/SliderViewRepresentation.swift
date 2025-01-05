//
//  SliderViewRepresentation.swift
//  SwiftUI&UIKit
//
//  Created by Perejro on 04/01/2025.
//

import Foundation
import SwiftUI

struct SliderViewRepresentation: UIViewRepresentable {
    @Binding var value: Float
    @Binding var opacity: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = value
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: opacity)
        uiView.value = value
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension SliderViewRepresentation {
    final class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            value = sender.value
        }
    }
}

#Preview {
    SliderViewRepresentation(value: .constant(50), opacity: .constant(0.1))
}
