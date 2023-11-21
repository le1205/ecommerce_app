//
//  CustomeButton2.swift
//  RealityFence
//
//  Created by Secret on 7/1/23.
//

import SwiftUI

struct CustomButton2: View {
    var text: String
    var status: Bool
    var invert: Bool?
    var rounded: Bool?
    let buttonWidth: Int
    var clicked: (() -> Void)
    var Button_color: Color {
        return status ? Color(red: 0.12, green: 0.66, blue: 1) : Color.gray.opacity(0.3)
    }
    var Text_color: Color {
        return status ? Color.white : Color.gray
    }
    
    var body: some View {
        Button(action: clicked) {
            Text(text)
                .font(.system(size: 18))
                .padding(.vertical, 17)
                .fontWeight(.semibold)
                .foregroundColor(Text_color)
                .frame(maxWidth: .infinity)
        }
        .background(Button_color)
        .cornerRadius(14)
        .frame(width: CGFloat(buttonWidth), height: 50, alignment: .center)
    }
}
