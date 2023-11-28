//
//  ToDoListItem.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let description: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
    
}
