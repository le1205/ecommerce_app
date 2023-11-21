//
//  SubHeader.swift
//  RealityFence
//
//  Created by Secret on 7/7/23.
//

import SwiftUI

struct SubHeader: View {
    var text : String
    var title : String
    var act : any Numeric
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        HStack(){
           
                CustomeBackButton(text: text, status: true)
                .onTapGesture {
                    dismiss()
                }
            
                Text(title)
                    .font(.system(size: 18))
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 0.13, green: 0.17, blue: 0.21))
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? 780 : 180, height: 36, alignment: .center)
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
}
