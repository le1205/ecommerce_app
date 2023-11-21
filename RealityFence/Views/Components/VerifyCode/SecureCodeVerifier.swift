//
//  SecureCodeVerifier.swift
//  RealityFence
//
//  Created by Secret on 7/17/23.
//

import SwiftUI

public struct SecureCodeVerifier: View {

    /// The style applied to SecureCodeVerifier
//@Environment(\.secureCodeStyle) var style: SecureCodeStyle

@State private var insertedCode: String = ""
@State private var isTextFieldFocused: Bool = true

@StateObject private var viewModel: SecureCodeVerifierViewModel

    /// The size of the SecureCodeVerifier
private var textfieldSize: CGSize = .zero

private var action: ((Bool) -> Void)?
    
public init(code: String) {
    self._viewModel = StateObject(wrappedValue: SecureCodeVerifierViewModel(code: code))
    let height = 37.0
    let width = (40 * CGFloat(code.count)) + (15 * CGFloat(code.count - 1))
    self.textfieldSize = CGSize(width: width, height: height)
}

public var body: some View {
    CodeView(fields: viewModel.fields)
        .background(
            Rectangle()
                .foregroundColor(.white)
        )
        .background(
            SecureTextfield(text: $insertedCode, isFocusable: $isTextFieldFocused, labels: viewModel.fieldNumber)
        )
        .contentShape(Rectangle())
        .onTapGesture {
            isTextFieldFocused.toggle()
        }
        .frame(width: textfieldSize.width, height: textfieldSize.height)
        .padding()
        .onChange(of: insertedCode) { newValue in
            viewModel.buildFields(for: newValue)
        }
        .onReceive(viewModel.$codeCorrect.dropFirst()) { value in
            action?(value)
        }
}
}

extension SecureCodeVerifier {
    public func onCodeFilled(perform action: ((Bool) -> Void)?) -> Self {
        var copy = self
        copy.action = action
        return copy
    }
}

struct SecureCodeVerifier_Previews: PreviewProvider {
    static var previews: some View {
        SecureCodeVerifier(code: "1234")
    }
}
