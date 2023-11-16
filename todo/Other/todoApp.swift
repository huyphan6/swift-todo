//
//  todoApp.swift
//  todo
//
//  Created by Huy Phan on 11/15/23.
//

import SwiftUI
import FirebaseCore

@main
struct todoApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                MainView()
            }
        }
    }
}
