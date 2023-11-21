//
//  AuthenticationViewModel.swift
//  RealityFence
//
//  Created by Secret on 7/6/23.
//

import Foundation

extension SignView {
    @MainActor class ViewModel: ObservableObject {
        // Set activeScreen to private to hide from View preventing modifications from View
        @Published var activeScreen: AuthScreens = .LOGIN
        
        enum AuthScreens: Int {
            case LOGIN = 0
            case REGISTER = 1
        }
        
        func switchScreen() -> Void {
            switch activeScreen {
            case .LOGIN: // LOGIN active
                activeScreen = .REGISTER
                break
            case .REGISTER:
                activeScreen = .LOGIN
                break
            }
        }
        
    }
}
