//
//  LoginView.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import SwiftUI

struct LoginView: View {
    @StateObject var loginViewModel = LoginVIewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "todo", subtitle: "do or do not, there is no try", angle: 1/Double.pi, backgroundColor: Color.blue)
                
                // Login form
                Form {
                    if !loginViewModel.errorMessage.isEmpty {
                        Text(loginViewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    
                    TextField("Email", text: $loginViewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding(.bottom, 2)
                        .autocapitalization(.none)
                    SecureField("Password", text: $loginViewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding(.bottom, 2)
                    
                    // sign in button
                    TDLButton(
                        title: "Login",
                        color: Color.blue
                    ) {
                        // attempt login here
                        loginViewModel.login()
                        }
                    .padding()
                }
                
                // register button, if new user
                VStack{
                    Text("New User?")
                    NavigationLink( destination: RegisterView(), label: {Text("Create An Account")}
                    )
                    .buttonStyle(.bordered)
                    .foregroundColor(Color.white)
                    .background(Color.green)
                    .cornerRadius(10)
                    
                }
                .padding(15)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
