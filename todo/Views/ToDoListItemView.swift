//
//  ToDoListItemView.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import SwiftUI

struct ToDoListItemView: View {
    let item: ToDoListItem
    @StateObject var toDoListItemViewModel = ToDoListItemViewViewModel()
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                /// shows title
                Text(item.description)
                    .font(.title)
                /// shows the due date
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened) )")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            /// Need a button to mark the task as complete or incomplete
            Button(action: {toDoListItemViewModel.toggleIsDone(item: item)}, label: {Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")})
        }
    }
}

#Preview {
    ToDoListItemView(item: .init(
        id: "123",
        description: "Buy Eggs",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: false
    ))
}
