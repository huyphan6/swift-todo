//
//  RegisterView.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import SwiftUI

struct RegisterView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "register", subtitle: "hard work pays off", angle: -1/(Double.pi), backgroundColor: Color.purple)
            
            // registration form
            Form {
                TextField("First Name", text: $firstName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email", text: $email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                
                TDLButton(
                    title: "Create Account",
                    color: Color.green
                ) {
                    // attempt registration
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
