//
//  AuthenticationService.swift
//  RealityFence
//
//  Created by Secret on 7/5/23.
//

import Foundation

fileprivate struct LoginResponse: Decodable {
    let code: Int
    let data: Tocken
    let message: String
//    struct Message: Decodable {
//        let email: String
//    }
    struct Tocken: Decodable {
        let accessToken: String
    }
}

fileprivate struct ForgetResponse: Decodable {
    let code: Int
    let message: String
}

fileprivate struct RegisterResponse: Decodable {
    let status_code: Int
    let accessToken: String?
    let message: String?
}

fileprivate struct ForgetBodyParams: Codable {
    let email: String
    init(_ email: String) {
        self.email = email
    }
}

fileprivate struct ResetBodyParams: Codable {
    let email: String
    let password: String
    let confirmPassword: String
    let verifyCode: String
    init(_ email: String, _ password: String, _ confirmPassword: String, _ verifyCode: String) {
        self.email = email
        self.password = password
        self.confirmPassword = confirmPassword
        self.verifyCode = verifyCode
    }
}

fileprivate struct LoginBodyParams: Codable {
    let email: String
    let password: String
    var type = 0
    var role = 2
    init(_ email: String, _ password: String, _ type: any Numeric, _ role: any Numeric) {
        self.email = email
        self.password = password
    }
}


fileprivate struct RegisterBodyParams: Codable {
    let username: String
    let password: String
    let address1: String
    let address2: String
    let zip_code: String
    let state: String
    let country: String
    let interestLevel: String
    let email: String
    let phone: String
    
    init(_ username: String, _ password: String, _ address1: String, _ address2: String, _ zip_code: String, _ state: String, _ country: String, _ interestLevel: String, _ email: String, _ phone: String) {
        self.username = username
        self.email = email
        self.zip_code = zip_code
        self.state = state
        self.country = country
        self.interestLevel = interestLevel
        self.password = password
        self.address1 = address1
        self.address2 = address2
        self.phone = phone
    }
}

class AuthenticationService {
    public func login(_ email: String, _ password: String) async throws -> String {
        let apiEndpoint = URL(string: "https://realityfence.herokuapp.com/auth/signin")!
        
        var request = URLRequest(url: apiEndpoint)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let type = 0
        let role = 2
        let bodyParams = LoginBodyParams(email, password, type, role)

        let bodyData = try JSONEncoder().encode(bodyParams)
        
        request.httpBody = bodyData
        
        let session = URLSession.shared
        let (responseData, _) = try await session.data(for: request)
        let decoded = try JSONDecoder().decode(LoginResponse.self, from: responseData)
        if decoded.code != 200 {
            throw AuthenticationError(status_code: decoded.code, serverMessage: decoded.message)
        }
        return decoded.data.accessToken
    }
    
    public func registerAccount(_ username: String, _ password: String, _ address1: String, _ address2: String,_ zip_code: String,_ state: String , _ country: String, _ interestLevel: String,_ email: String, _ phone: String) async throws -> String {
        // Regular expression checking should be done in the ViewModel of Register
        let apiEndpoint = URL(string: "https://realityfence.herokuapp.com/auth/signup")!
        
        var request = URLRequest(url: apiEndpoint)
        
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let bodyParams = RegisterBodyParams(username, password, address1, address2, zip_code, state, country,  interestLevel, email, phone )
        print("-1", bodyParams)
        let bodyData = try JSONEncoder().encode(bodyParams)
        
        request.httpBody = bodyData
        
        let session = URLSession.shared
        
        let (responseData, _) = try await session.data(for: request)
        print("------", String(data: responseData, encoding: .utf8))
        let decoded = try JSONDecoder().decode(RegisterResponse.self, from: responseData)
        
        if decoded.status_code != 201 {
            if decoded.message != nil {
                throw AuthenticationError(status_code: decoded.status_code, serverMessage: decoded.message!)
            }
            throw AuthenticationError(status_code: decoded.status_code, serverMessage: "Could not create account")
        }
        
        return decoded.accessToken!
    }
    
    // Errors
    public struct AuthenticationError: LocalizedError {
        public let status_code: Int?
        public var errorDescription: String?
        
        init(status_code: Int, serverMessage: String) {
            self.status_code = status_code
            self.errorDescription = serverMessage
        }
    }
    
    //ForgetPass
    public func foregotPassword(_ email: String) async throws -> String {
        
   // https://realityfence.herokuapp.com/
        let apiEndpoint = URL(string: "https://realityfence.herokuapp.com/auth/forgotPassword")!
        
        var request = URLRequest(url: apiEndpoint)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let bodyParams = try ForgetBodyParams(email)
        let bodyData = try JSONEncoder().encode(bodyParams)
        
        request.httpBody = bodyData
        
        let session = URLSession.shared
        
        let (responseData, _) = try await session.data(for: request)
        let decoded = try JSONDecoder().decode(ForgetResponse.self, from: responseData)
        if decoded.code != 200 {
            throw AuthenticationError(status_code: decoded.code, serverMessage: decoded.message)
        }

        return decoded.message
    }
    //ResetPass
    public func ResetPassword(_ email: String, _ verifyCode: String, _ password: String, _ confirmPassword: String) async throws -> String {
        
   // https://realityfence.herokuapp.com/
        let apiEndpoint = URL(string: "https://realityfence.herokuapp.com/auth/resetPassword")!
        
        var request = URLRequest(url: apiEndpoint)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let bodyParams = try ResetBodyParams(email, verifyCode, password, confirmPassword)
        let bodyData = try JSONEncoder().encode(bodyParams)
        
        request.httpBody = bodyData
        
        let session = URLSession.shared
        
        let (responseData, _) = try await session.data(for: request)
        let decoded = try JSONDecoder().decode(LoginResponse.self, from: responseData)
        if decoded.code != 200 {
            throw AuthenticationError(status_code: decoded.code, serverMessage: decoded.message)
        }

        return decoded.message
    }
    
}
