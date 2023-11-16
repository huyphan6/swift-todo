//
//  ContentView.swift
//  todo
//
//  Created by Huy Phan on 11/15/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Text("This is my first swift project!")
        }
        .padding()
    }
}

#Preview {
    MainView()
}
