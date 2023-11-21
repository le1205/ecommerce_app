//
//  SelectField.swift
//  RealityFence
//
//  Created by Secret on 7/14/23.
//

import SwiftUI

struct SelectField: View {

    let caption: String
//    let Selection: String
    @State private var selection = "Red"
    let items : [String]
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Picker("Select", selection: $selection) {
                                ForEach(items, id: \.self) {
                                    Text($0)
                                        .foregroundColor(.black)
                                }
                            }
                            .pickerStyle(MenuPickerStyle())
                            .labelsHidden()
                            .colorMultiply(.black) // Change the default selection color
                            .padding(10.5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 7)
                                    .stroke(Color(red: 80/255, green: 193/255, blue: 241/255 ))
                                    .frame(width: geometry.size.width)
                            )
                    Text(caption)
                        .font(.system(size: 11))
                        .kerning(0.066)
                        .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.26).opacity(0.6))
                        .frame(maxWidth: .infinity, minHeight: 12, maxHeight: 12, alignment: .leading)

            }
            .padding(.vertical, -2)
            // Align center
        } // End of Geometry Reader
        
    }
}

//struct SelectField_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectField( caption: "eeee", items: ["Red", "Green", "Blue", "Black", "Tartan"])
//    }
//}
