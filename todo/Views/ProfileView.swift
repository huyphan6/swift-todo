//
//  Profile.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var profileViewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = profileViewModel.user {
                    /// abstracts the view into a component like in react with a user prop
                    profile(user: user)
                }
                else {
                    Text("Loading Profile...")
                }

            }
            .navigationTitle("Profile")
        }
        .onAppear {
            profileViewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // show avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .frame(width: 125, height: 125)
            .padding()
        
        // show user info: name, email, member since
        VStack (alignment: .leading){
            HStack {
                Text("Name: ")
                    .bold()
                Text("\(user.firstName + " " + user.lastName)")
            }
            .padding(1)
            
            HStack {
                Text("Email: ")
                    .bold()
                Text("\(user.email)")
            }
            .padding(1)
            
            HStack {
                Text("Joined: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding(1)
        }
        .padding()
        
        Spacer()
        
        // sign out button
        TDLButton(title: "Log Out", color: .red, action: profileViewModel.logout)
            .frame(width: 100, height: 50, alignment: .center)
            .padding()
        
        Spacer()
    }
}

#Preview {
    ProfileView()
}
