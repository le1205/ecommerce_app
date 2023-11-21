//
//  CodeLabel.swift
//  RealityFence
//
//  Created by Secret on 7/17/23.
//

import SwiftUI

/// The smallest view in the verifier.
/// Contains the text label and the blinking carrier when needed
struct CodeLabel: View {
    
    let labelState: CodeLabelState
    
    private var lineColor: Color = .clear
    private var textColor: Color = .clear
    
    init(state: CodeLabelState) {
        self.labelState = state
        self.lineColor = .black
        self.textColor = .black
    }
    
    public var body: some View {
        VStack(spacing: 5) {
            Text(labelState.textLabel)
                .font(.system(size: 22))
                .fontWeight(.bold)
                .foregroundColor(textColor)
                .frame(width: 40, height: 30, alignment: .center)
                .overlay(carrier)
            Rectangle()
                .frame(width: 40, height: 2)
                .foregroundColor(lineColor)
        }
    }
    
    @ViewBuilder var carrier: some View {
        if labelState.prompting {
            Carrier(height: 30, color: .black)
        }
    }
}
