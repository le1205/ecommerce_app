//
//  Carrier.swift
//  RealityFence
//
//  Created by Secret on 7/17/23.
//

import SwiftUI

struct Carrier: View {
    @State private var blinking: Bool = false
    
    var height: CGFloat
    var color: Color
    
    var body: some View {
        Rectangle()
            .frame(width: 1.5, height: height, alignment: .center)
            .foregroundColor(color)
            .animation(nil, value: blinking)
            .opacity(blinking ? 0 : 1)
            .animation(.easeInOut(duration: 0.8).repeatForever(autoreverses: true), value: blinking)
            .onAppear {
                blinking.toggle()
            }
    }
}
