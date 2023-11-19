//
//  User.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import Foundation

struct User: Codable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let joined: TimeInterval
}
