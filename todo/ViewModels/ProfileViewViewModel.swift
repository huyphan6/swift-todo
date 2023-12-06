//
//  ProfileViewViewModel.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
    init() {}
    
    @Published var user: User? = nil
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .getDocument {
                [weak self] snapshot, error in
                guard let data = snapshot?.data(), error == nil else {
                    return
                }
                
                /// api call to fetch current user
                DispatchQueue.main.async {
                    self?.user = User(
                                    id: data["id"] as? String ?? "",
                                    firstName: data["firstName"] as? String ?? "",
                                    lastName: data["lastName"] as? String ?? "",
                                    email: data["email"] as? String ?? "",
                                    joined: data["joined"] as? TimeInterval ?? 0
                                    )
                }
            }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        }
            catch {
                print(error)
            }
    }
}
