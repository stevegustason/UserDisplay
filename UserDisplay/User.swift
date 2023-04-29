//
//  User.swift
//  UserDisplay
//
//  Created by Steven Gustason on 4/29/23.
//

import Foundation

struct User {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}
