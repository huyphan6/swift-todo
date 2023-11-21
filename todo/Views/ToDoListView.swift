//
//  ToDoListItemsView.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import SwiftUI

struct ToDoListView: View {
    @StateObject var toDoListViewModel = ToDoListViewViewModel()
    private let userId: String
    
    init (userId: String) {
        self.userId = userId
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // action
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}
