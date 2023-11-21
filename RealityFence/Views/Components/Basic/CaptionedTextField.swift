//
//  CaptionedTextField.swift
//  RealityFence
//
//  Created by Secret on 7/5/23.
//

import SwiftUI

struct CaptionedTextField: View {
    let caption: String
    @Binding var text: String
    var body: some View {
        GeometryReader { geometry in
            VStack {
                VStack(alignment: .leading){
                    ZStack(alignment: .leading) {
                        TextField(
                            "",
                            text: $text
                        )
                        .autocapitalization(.none)
                        .foregroundColor(Color.black)
                        
                    }
                    .padding(17)
                    .frame(height: 55)
                    .overlay(
                        RoundedRectangle(cornerRadius: 7)
                            .stroke(Color(red: 80/255, green: 193/255, blue: 241/255 ))
                    )
                    Text(caption)
                        .font(.system(size: 11))
                        .kerning(0.066)
                        .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                        .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .leading)

                }
            }
//            .frame(width: geometry.size.width * 0.8)
                // Align center
        } // End of Geometry Reader
        .frame(height: 80)
    }
}

struct CaptionedTextField_Previews: PreviewProvider {
    static var previews: some View {
        CaptionedTextField(caption: "Username", text: .constant(""))
    }
}
