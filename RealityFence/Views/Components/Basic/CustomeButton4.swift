//
//  CustomeButton4.swift
//  RealityFence
//
//  Created by Secret on 7/5/23.
//

import SwiftUI

struct CustomeButton4: View {
    var text: String
    var text_size: Int
    var button_size: Int
    var button_heigh: Int
    var status: Bool
    var clicked: (() -> Void)
    
    var body: some View {
        Button(action: clicked) {
            Text(text)
                .font(.system(size: CGFloat(text_size), weight: .bold))
              .multilineTextAlignment(.center)
              .foregroundColor(.white)
              .frame(width: 170, height: 114, alignment: .center)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 14)
        .frame(width: CGFloat(button_size), height: CGFloat(button_heigh) , alignment: .center)
        .background(Color(red: 0.12, green: 0.66, blue: 1))
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
    }
}


