//
//  TDLButton.swift
//  todo
//
//  Created by Huy Phan on 11/17/23.
//

import SwiftUI

struct TDLButton: View {
    let title: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(color)
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
        }
    }
}

#Preview {
    TDLButton(title: "Title", color: Color.cyan){
        // action
    }
}
