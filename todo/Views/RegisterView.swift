//
//  RegisterView.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var registerViewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "register", subtitle: "hard work pays off", angle: -1/(Double.pi), backgroundColor: Color.purple)
            
            // registration form
            Form {
                TextField("First Name", text: $registerViewModel.firstName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Last Name", text: $registerViewModel.lastName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $registerViewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $registerViewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                TDLButton(
                    title: "Create Account",
                    color: Color.green
                ) {
                    // attempt registration
                    registerViewModel.register()
                    }
                .padding()
            }
            .offset(y: -50)
            
            
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
