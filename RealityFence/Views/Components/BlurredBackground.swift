//
//  BlurredBackground.swift
//  RealityFence
//
//  Created by Secret on 7/5/23.
//

import SwiftUI
import Foundation

struct BlurredBackground: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        DispatchQueue.main.async {
            // Superview twice to make fullScreenCover transparent
            // Child ZStack -> fullScreenSheet
            view.superview!.superview!.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}
