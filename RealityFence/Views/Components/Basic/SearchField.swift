//
//  SearchField.swift
//  RealityFence
//
//  Created by Secret on 7/17/23.
//

import SwiftUI

struct SearchField: View {
    @State private var selectedOptionIndex = 0
        private let options = ["Option 1", "Option 2", "Option 3"]

        var body: some View {
            VStack {
                Picker(selection: $selectedOptionIndex, label: Text("Select Option")) {
                    ForEach(0 ..< options.count) { index in
                        Text(self.options[index])
                            .tag(index)
                            .foregroundColor(.black)
                    }
                }
                .pickerStyle(MenuPickerStyle())
                .labelsHidden()
                .colorMultiply(.black) // Change the default selection color

                Text("Selected option: \(options[selectedOptionIndex])")
                    .padding()
            }
            .padding()
        }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchField()
    }
}
