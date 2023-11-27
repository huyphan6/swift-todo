//
//  NewItemView.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var newItemViewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 30)
            
            Form {
                // Description
                TextField("Description", text: $newItemViewModel.description)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                // Due Date
                DatePicker("Due Date", selection: $newItemViewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .padding()
                
                // Submit Button
                TDLButton(title: "Add", 
                          color: Color.blue)
                {
                    if newItemViewModel.canSave {
                        newItemViewModel.save()
                        newItemPresented = false
                    }
                    else {
                        // show an alert that there is an error in one of the fields above
                        newItemViewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert(isPresented: $newItemViewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text("Please fill in all fields and select due dates today or greater"))
                }
            )
        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {return true}, set: {_ in }))
}
