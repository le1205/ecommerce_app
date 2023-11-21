//
//  UserData.swift
//  RealityFence
//
//  Created by Secret on 7/5/23.
//

import Foundation


class UserData: ObservableObject {
    
    @Published var authToken: String = ""
    @Published var msg: String = ""
    @Published var user_id: String = ""
    @Published var username: String = ""
    @Published var address1: String = ""
    @Published var address2: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var zip_code: String = ""
    @Published var location: String = ""
    @Published var getFences: Bool = false
    @Published var duration: CGFloat = 0.0
    
    func resetUserData() {
        authToken =  ""
        user_id = ""
        email = ""
        location = ""
        getFences = false
        msg = ""
        duration = 0.0

    }
}

