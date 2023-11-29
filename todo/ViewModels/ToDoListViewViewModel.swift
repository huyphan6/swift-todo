//
//  ToDoListViewViewModel.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import Foundation

/// main view for all to do list items

class ToDoListViewViewModel: ObservableObject {
    init() {}
    
    @Published var showingNewItemView = false
    
    /// deletes a todo item given its id
    func delete(id: String) {
        
    }
}
