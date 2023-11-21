//
//  CustomeButton3.swift
//  RealityFence
//
//  Created by Secret on 7/3/23.
//

import SwiftUI

struct CustomeButton3: View {
    var text: String
    let submitAction: () async -> Void
    
    var body: some View {
        VStack(alignment: .center) {
            Button(action: {
                Task {
                    await submitAction()
                }
            }) {
                Text(text)
                    .font(.system(size: 14))
                    .padding(.vertical, 3)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity)
            }
        }
        .padding(.horizontal, 1)
        .padding(.vertical, 10)
        .frame(width: 100, height: 43, alignment: .top)
        .background(.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .inset(by: 0.5)
                .stroke(Color(red: 0.57, green: 0.62, blue: 0.67).opacity(0.24), lineWidth: 1)
        )
    }
    
}

