//
//  User.swift
//  Archiver
//
//  Created by Joanna Zatorska on 06/06/2017.
//  Copyright © 2017 Joanna Zatorska. All rights reserved.
//

import Foundation

public struct User {
    public let id: String
    public let name: String
    
    public init(id: String,
                name: String) {
        self.id = id
        self.name = name
    }
}
