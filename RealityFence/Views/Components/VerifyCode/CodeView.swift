//
//  CodeView.swift
//  RealityFence
//
//  Created by Secret on 7/17/23.
//

import SwiftUI

/// Represents the list of all secure code fields
struct CodeView: View {
//    @Environment(\.secureCodeStyle) var style: SecureCodeStyle
    
    var fields: [CodeLabelState]
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 15) {
            ForEach(fields) { labelState in
                CodeLabel(state: labelState)
            }
        }
    }
}

