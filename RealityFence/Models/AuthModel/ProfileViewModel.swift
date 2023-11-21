//
//  ProfileViewModel.swift
//  RealityFence
//
//  Created by Secret on 7/14/23.
//

import Foundation

extension ProfileView {
    @MainActor class ViewModel: ObservableObject {
        // Input variables
        @Published var company_name: String = ""
        @Published var saller_name: String = ""
        @Published var saller_phone: String = ""
        @Published var saller_email: String = ""
        
        @Published var isLoading: Bool = false
        
        @Published var errorMessage: String = ""
        
        func attemptCreateAccount(userData: UserData) async {

            // Do regular expression checking
            let validator = InputValidator()
            
            if validator.validateUsername(username: saller_name) == false {
                errorMessage = "Invalid username. Username must be at least 6 characters and can only contain alphanumeric characters and at least one alphabet character"
                return
            }
            
            if validator.validateEmail(email: saller_email) == false {
                errorMessage = "Invalid Email. Allowed: www@ww.com"
                return
            }
            
            
            do {
                isLoading = true
                defer {
                    isLoading = false
                }
                
            } catch let error {
                print(error.localizedDescription)
                if type(of: error) == AuthenticationService.self.AuthenticationError.self {
                    print("API Call Error")
                    errorMessage = error.localizedDescription
                } else {
                    print("SwiftUI Error")
                    errorMessage = "The application encountered an error"
                }
            }
        }
        
    }
}
