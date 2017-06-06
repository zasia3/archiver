//
//  Authentication.swift
//  Archiver
//
//  Created by Joanna Zatorska on 06/06/2017.
//  Copyright © 2017 Joanna Zatorska. All rights reserved.
//

import Foundation
import Domain
import Keychain

public final class Authentication {
    
    public static let shared = Authentication()
    
    private struct Keys {
        static let userId = "UserIdKey"
        static let userName = "UserNameKey"
        static let userToken = "UserTokenKey"
    }
    
    public static func setUser(_ user: User) {
        KeychainWrapper.standard.set(user.id, forKey: Keys.userId)
        KeychainWrapper.standard.set(user.name, forKey: Keys.userName)
    }
    
    public static func setAuthToken(_ token: String) {
        KeychainWrapper.standard.set(token, forKey: Keys.userToken)
    }
    
    public static func getAuthToken(_ token: String) -> String? {
        return KeychainWrapper.standard.string(forKey: Keys.userToken)
    }

    public static func authenticatedUser() -> User? {
        guard let id = KeychainWrapper.standard.string(forKey: Keys.userId),
            let name = KeychainWrapper.standard.string(forKey: Keys.userName) else {
                return nil
        }
        return User(id: id, name: name)
    }
    
    public static func clear() {
        let _ = KeychainWrapper.standard.removeAllKeys()
    }
}
