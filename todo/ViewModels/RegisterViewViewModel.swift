//
//  RegisterViewViewModel.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var email = ""
    @Published var password = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) 
            {
            [weak self] result, error in
                guard let userId = result?.user.uid
                    else {
                        return
                    }
                self?.insertUserRecord(id: userId)
            }
    }
    
    private func insertUserRecord(id: String) {
        // create obj that creates a user
        let newUser = User(id: id,
                           firstName: firstName,
                           lastName: lastName,
                           email: email,
                           joined: Date().timeIntervalSince1970)
        
        // insert into database
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool{
        // make sure all fields are filled out
        guard !firstName.trimmingCharacters(in: .whitespaces).isEmpty,
              !lastName.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            return false
        }
        
        // email format must contain an @ sign and a period
        guard email.contains("@") && email.contains(".") else {
            return false
        }
        
        // make sure password is longer than 6 characters for security
        guard email.count >= 6 else {
            return false
        }
        
        return true
    }
    
}
