//
//  CustomeBackButton.swift
//  RealityFence
//
//  Created by Secret on 7/3/23.
//

import SwiftUI

struct CustomeBackButton: View {
    var text: String
    var status: Bool
    var invert: Bool?
    var rounded: Bool?

    var body: some View {
        VStack {
           
                ZStack {
                    VStack {
                        Spacer()
                        HStack(alignment: .center) {
                            Image("arrow-left")
                                .padding(.horizontal, -1)
                            Text(text)
                                .font(.system(size: 18))
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                }
            
        }
        .frame(width: 80, height: 35, alignment: .top)
        .background(.white)
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
        .overlay(
          RoundedRectangle(cornerRadius: 16)
            .inset(by: 0.5)
            .stroke(Color(red: 0.57, green: 0.62, blue: 0.67).opacity(0.24), lineWidth: 1)
        )
       
        .background(.white)
        .cornerRadius((rounded ?? true) ? 40 : 10)
        .disabled(((invert ?? false) ? !status : status) == false)
        .frame(width: 77, height: 33)
    }
}


