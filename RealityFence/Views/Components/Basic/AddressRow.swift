//
//  AddressRow.swift
//  RealityFence
//
//  Created by Secret on 7/17/23.
//

import SwiftUI

struct AddressRow: View {
    @Environment (\.dismiss) var dismiss
    let address: AddressResult
    @Binding var location: String
    @Binding var resetFlag: Bool
    
    var body: some View {
 
        VStack(alignment: .leading) {
            Text(address.title)
            Text(address.subtitle)
                .font(.caption)
        }
        
        .padding(.bottom, 2)
        .onTapGesture{
            location = "\(address.title), \(address.subtitle)"
            resetFlag = false
            dismiss()
            
        }
    }
}
