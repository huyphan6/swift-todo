//
//  ToDoListItemViewViewModel.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

/// view for one singular to do list item

class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        /// update isDone property
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        /// update the value in the database
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
