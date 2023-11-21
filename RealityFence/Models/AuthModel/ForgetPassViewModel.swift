//
//  ForgetPassViewModel.swift
//  RealityFence
//
//  Created by Secret on 7/7/23.
//

import Foundation

extension ForgetPassView {
    @MainActor class ViewModel: ObservableObject {
        
        // Input variables
        @Published var email: String = ""
        
        @Published var isLoading: Bool = false
        
        @Published var errorMessage: String = ""
        
        @Published var authSuccessful: Bool = false
        
        func attemptSend(userData: UserData) async {
            let validator = InputValidator()
            isLoading = true
            defer {
                isLoading = false
            }
            do {
                if email.isEmpty {
                    errorMessage = "Email field is required"
                    return
                } else if validator.validateEmail(email: email) == false {
                    errorMessage = "Invalid Email. Allowed: www@ww.com"
                    return
                } else {
                    let msg = try await AuthenticationService().foregotPassword(email)
                    userData.msg = msg
                    authSuccessful = true
//                    print("$$", authSuccessful)
                }
               
            } catch let error {
                if type(of: error) == AuthenticationService.self.AuthenticationError.self {
                    errorMessage = error.localizedDescription
                } else {
                    print("Application error: ", error.localizedDescription)
                    errorMessage = "Connection error"
                }
                authSuccessful = false
            }
        }
        
    }
}
