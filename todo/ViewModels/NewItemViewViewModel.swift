//
//  NewItemViewViewModel.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import Foundation

class NewItemViewViewModel: ObservableObject {
    init() {}
    
    @Published var description = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    func save() {
        
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
