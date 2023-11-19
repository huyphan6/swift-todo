//
//  ContentView.swift
//  todo
//
//  Created by Huy Phan on 11/15/23.
//

import SwiftUI

struct MainView: View {
    @StateObject var mainViewModel = MainViewViewModel()
    
    // if the user is not signed in, show the Login View, otherwise show the todo view
    var body: some View {
        if mainViewModel.isSignedIn && !mainViewModel.currentUserId.isEmpty {
            // show the home page
            ToDoListView()
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
