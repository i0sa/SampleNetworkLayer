//
//  AuthManager.swift
//  ToDoList2019
//
//  Created by Osama on 9/23/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//

import Foundation

// consider this a real user manager or auth or whatever that has the authentication key stored
class AuthManager {
    
    static var loggedIn = false
    
    static func authKey() -> String {
        return "Bearer 201030400"
    }
}
