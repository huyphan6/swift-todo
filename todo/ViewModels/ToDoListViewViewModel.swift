//
//  ToDoListViewViewModel.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import Foundation
import FirebaseFirestore

/// main view for all to do list items

class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    /// deletes a todo item given its id
    /// - Parameter id: <#id description#>
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }
}
