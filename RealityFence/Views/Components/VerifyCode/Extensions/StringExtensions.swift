//
//  StringExtensions.swift
//  RealityFence
//
//  Created by Secret on 7/17/23.
//

import Foundation
extension String {
    var isNumeric: Bool {
        guard !self.isEmpty else { return false }
        return CharacterSet(charactersIn: self).isSubset(of: CharacterSet.decimalDigits)
    }
}
