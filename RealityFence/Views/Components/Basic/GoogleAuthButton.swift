//
//  GoogleAuthButton.swift
//  RealityFence
//
//  Created by Secret on 7/1/23.
//

import SwiftUI

struct GoogleAuthButton: View {
    var body: some View {
        Button(action: {
            // Handle Google authentication action
            authenticateWithGoogle()
        }) {
            HStack {
                Image("google_logo")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 10)
                
                Text("Continue with Google")
                    .foregroundColor(.black)
                    .font(.system(size: 17, weight: .bold))
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .cornerRadius(8)
            .overlay(
            RoundedRectangle(cornerRadius: 10)
            .inset(by: 0.75)
            .stroke(Color(red: 80/255, green: 193/255, blue: 241/255), lineWidth: 1.5)
            )
        }
    }
    
    func authenticateWithGoogle() {
        // Perform Google authentication logic here
        print("Sign in with Google tapped!")
    }
}
