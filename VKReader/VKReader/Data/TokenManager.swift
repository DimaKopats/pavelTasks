//
//  TokenManager.swift
//  VKReader
//
//  Created by Dzmitry Kopats on 12/21/17.
//  Copyright © 2017 Dzmitry Kopats. All rights reserved.
//

import Foundation

class TokenManager {
    let tokenKey = "token"
    func getToken() -> String? {
        if let token = UserDefaults.standard.string(forKey: tokenKey) {
            print("token =            \(token)")
            return token
        }
        return nil
    }
    
    func save(token: String) {
        UserDefaults.standard.set(token, forKey: "token")
    }
}
