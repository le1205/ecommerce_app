//
//  FencesService.swift
//  RealityFence
//
//  Created by Secret on 7/10/23.
//

import Foundation

public struct CategoryResponse: Decodable {
    let code: Int
    let message: String
    let data: CategoryData
    
    struct CategoryData: Decodable {
        let user: User
        let categories: [Categories]
        let selectedFences: [Fences]
        let favoriteFences: [Fences]
    }
    
    struct User: Decodable {
        let id: String
        let fullName: String
        let phoneNumber: String
        // Add more properties as needed
    }
    
    struct Categories: Decodable {
        let id: String
        let name: String
        let images: Images
        let sub_categories: [Styles]
        let styles: [Styles]
        let colors: [Styles]
        // Add more properties as needed
    }
    
    struct Fences: Decodable {
        let id: String
        let name: String
        let description: String
        let filesImage: [Images]
        let category: String
        let sub_category: String
        let style: String
        let color: String
        let size: String
        let tags: [String]
        // Add more properties as needed
    }
    
    struct Styles: Decodable {
        let title: String
        let preview: String
    }
    
    struct Images: Decodable {
        let preview: String
//        let key: String
        // Add more properties as needed
    }
}



class FencesService {
    // Errors
    public struct FencesError: LocalizedError {
        public let status_code: Int?
        public var errorDescription: String?
        
        init(status_code: Int, serverMessage: String) {
            self.status_code = status_code
            self.errorDescription = serverMessage
        }
    }
    
    public func category(_ user_id: String) async throws -> CategoryResponse {
        let id = user_id
        let apiEndpoint = URL(string: "https://realityfence.herokuapp.com/user/getAllIOS/\(id)")!
        
        var request = URLRequest(url: apiEndpoint)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
       
        let (responseData, _) = try await session.data(for: request)
        print("------", String(data: responseData, encoding: .utf8))
        let decoded = try JSONDecoder().decode(CategoryResponse.self, from: responseData)
        if decoded.code != 200 {
            throw FencesError(status_code: decoded.code, serverMessage: decoded.message)
        }
        
        return decoded
    }
    
}
