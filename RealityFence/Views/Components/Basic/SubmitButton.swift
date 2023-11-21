//
//  SubmitButton.swift
//  RealityFence
//
//  Created by Secret on 7/5/23.
//

import SwiftUI

struct SubmitButton: View {
    @EnvironmentObject var userData: UserData
    
    let text: String
    let submitAction: () async -> Void
    let buttonWidth: Int
    
    var body: some View {
        Button(action: {
            Task {
                await submitAction()
            }
        }) {
            Text(text)
                .font(.system(size: 18, weight: .bold))
                .padding(.vertical, 17)
                .foregroundColor(Color.white)
                .frame(maxWidth: .infinity)
        }
        .background(Color(red: 0.12, green: 0.66, blue: 1))
        .cornerRadius(14)
        .frame(width: CGFloat(buttonWidth), height: 50, alignment: .center)
        }
    
    
}

//struct SubmitButton_Previews: PreviewProvider {
//    static var previews: some View {
//        SubmitButton(text: "", submitAction: {}){
//
//        }
//    }
//}
