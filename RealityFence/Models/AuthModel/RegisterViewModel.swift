//
//  RegisterViewModel.swift
//  RealityFence
//
//  Created by Secret on 7/6/23.
//

import Foundation

extension SignView {
    @MainActor class ViewModel: ObservableObject {
        // Input variables
        @Published var username: String = ""
        @Published var address1: String = ""
        @Published var address2: String = ""
        @Published var zip_code: String = ""
        @Published var state: String = ""
        @Published var country: String = ""
        @Published var interest_level : Int = 0
        
        @Published var password: String = ""
        @Published var confirmedPassword: String = ""
        
        @Published var email: String = ""
        @Published var phone: String = ""
        
        
        @Published var location: String = ""
        
        @Published var isLoading: Bool = false
        
        @Published var errorMessage: String = ""
        
        func attemptCreateAccount(userData: UserData) async {
            print("##$#$")
            if password != confirmedPassword {
                errorMessage = "Passwords do not match"
                return
            }
            // Do regular expression checking
            let validator = InputValidator()
            var interestLevel = String(interest_level)
            if interest_level == 1 {
                interestLevel = "Just looking"
            } else {
                interestLevel = "Ready to buy"
            }
//            if validator.validateUsername(username: username) == false {
//                errorMessage = "Invalid username. Username must be at least 6 characters and can only contain alphanumeric characters and at least one alphabet character"
//                return
//            }
            
            if validator.validateEmail(email: email) == false {
                errorMessage = "Invalid Email. Allowed: www@ww.com"
                return
            }
            
            if validator.validatePassword(password: password) == false {
                errorMessage = "Invalid password. Password must be at least 6 characters. Only symbols allowed: !,@,#,$,%,^,&,*,(,),{,},<,>,.,;"
            }
            
//            if location != "" {
//                if validator.validateLocation(location: location) == false {
//                    errorMessage = "Invalid location entered"
//                }
//            }
            print("##$#$3434")
            do {
                print("##$#$444555")
                isLoading = true
                defer {
                    isLoading = false
                }
                if email.isEmpty && !password.isEmpty {
                    errorMessage = "Email field is required"
                    return
                } else if !email.isEmpty && password.isEmpty {
                    errorMessage = "Password field is required"
                    return
                } else if email.isEmpty && password.isEmpty {
                    errorMessage = "Neither email nor password received"
                    return
                } else {
                    let authToken = try await AuthenticationService().registerAccount(username, password, address1, address2, zip_code, state, country, interestLevel, email, phone)
                    userData.authToken = authToken
//                    authSuccessful = true
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
