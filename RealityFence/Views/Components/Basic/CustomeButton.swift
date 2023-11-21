//
//  CustomeButton.swift
//  RealityFence
//
//  Created by Secret on 7/1/23.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var status: Bool
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
                .font(.system(size: 18, weight: .bold))
                .padding(.vertical, 17)
                .foregroundColor(Text_color)
                .frame(maxWidth: .infinity)
        }
        .background(Button_color)
        .cornerRadius(14)
        .frame(width: 350, height: 50, alignment: .center)
    }
}
