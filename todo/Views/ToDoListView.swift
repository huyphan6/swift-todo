//
//  ToDoListItemsView.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    @StateObject var toDoListViewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem] // query that continuously listens for items
    
    init (userId: String) {
        /// path to get user's todos: `users/<uid>/todos/<entries>`
        /// which is why we need to pass in the userID when instantiating the View
        
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        
        self._toDoListViewModel =  StateObject(
            wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            /// Vstack to vertically stack all to do list items
            VStack {
                List(items) {
                    /// similar to python for word in list syntax
                    item in ToDoListItemView(item: item)
                        .swipeActions {
                            Button(action: {toDoListViewModel.delete(id: item.id)}, 
                                   label: {Text("Delete")}
                            )
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    // action
                    toDoListViewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $toDoListViewModel.showingNewItemView){
                NewItemView(newItemPresented: $toDoListViewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "GeGs4fzfpMV5qGfxFkMOuhz6Mcm1")
}
