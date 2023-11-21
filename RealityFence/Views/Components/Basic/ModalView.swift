//
//  ModalView.swift
//  RealityFence
//
//  Created by Secret on 7/21/23.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let modalWidth: CGFloat = 240
    let modalHeight: CGFloat = 180
    
    var body: some View {
        VStack {
            Text("Do you want to remove?")
                .font(.system(size: 20))
                .padding()
            HStack {
                Button("Close") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .frame(width: 50, height: 30)
                Button("Yes") {
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .frame(width: 50, height: 30)
            }
        }
        .frame(width: modalWidth, height: modalHeight)
        .background(Color.white)
        .cornerRadius(10)
    }
}
