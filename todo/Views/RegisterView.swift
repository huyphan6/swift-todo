//
//  RegisterView.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import SwiftUI

struct RegisterView: View {
    var body: some View {
        VStack {
            // Header
            HeaderView(title: "register", subtitle: "hard work pays off", angle: -1/Double.pi, backgroundColor: Color.red)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
