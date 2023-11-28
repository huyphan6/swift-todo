//
//  NewItemViewViewModel.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class NewItemViewViewModel: ObservableObject {
    init() {}
    
    @Published var description = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    func save() {
        guard canSave else {
            return
        }
        
        // get user ID
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   description: description,
                                   dueDate: dueDate.timeIntervalSince1970,
                                   createdDate: Date().timeIntervalSince1970,
                                   isDone: false)
        
        /// save model to DB as a subCollection: each user has their own to do items so we also need to pass in the user's ID
        /// get an instance of the DB
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos") /// creates a sub collection for the current user
            .document(newId)
            .setData(newItem.asDictionary())
    
        
        
        
    }
    
    // .trimmingCharacters(in: .whitespaces) makes sure that we can't just add whitespaces
    var canSave: Bool {
        guard !description.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // Date() is today's date
        // -86400 is 24 hours converted to seconds
        // We subtract a day due bc its an edge case
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
