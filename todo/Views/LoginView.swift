//
//  LoginView.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "todo", subtitle: "do or do not, there is no try", angle: 1/Double.pi, backgroundColor: Color.cyan)
                
                // Login form
                Form {
                    TextField("Email", text: $email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding(.bottom, 2)
                    SecureField("Password", text: $password)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .padding(.bottom, 2)
                    
                    // sign in button
                    Button(
                        action: {
                            //
                        },
                        label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(Color/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                                Text("Login")
                                    .foregroundColor(Color.white)
                                    .bold()
                            }
                        }
                    )
                    .padding(.bottom, 2)
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
