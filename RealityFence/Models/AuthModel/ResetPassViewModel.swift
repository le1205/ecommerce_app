//
//  ResetPassViewModel.swift
//  RealityFence
//
//  Created by Secret on 7/7/23.
//

import Foundation

extension ResetPassView {
    @MainActor class ViewModel: ObservableObject {
        
        @Published var email: String = ""
        @Published var verifyCode: String = ""
        @Published var password: String = ""
        
        @Published var confirmedPassword: String = ""
        
        @Published var authSuccessful: Bool = false
        
        @Published var isLoading: Bool = false
        @Published var errorMessage: String = ""
        
        func attemptReset(userData: UserData) async {
            
            isLoading = true
            defer {
                isLoading = false
            }
            do {
                if password != confirmedPassword {
                    errorMessage = "Passwords do not match"
                    return
                } else if password.isEmpty {
                    errorMessage = "Password field is required"
                } else if confirmedPassword.isEmpty {
                    errorMessage = "Confirm Password field is required"
                } else {
                    let token = try await AuthenticationService().ResetPassword(email, verifyCode, password, confirmedPassword)
                    userData.authToken = token
                    authSuccessful = true
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
