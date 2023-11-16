//
//  HeaderView.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.cyan)
                .rotationEffect(Angle(radians: 1/Double.pi))
            
            // Header
            VStack {
                Text("todo")
                    .font(.system(size: 50))
                    .bold()
                    .foregroundColor(Color.white)
                    .padding(.bottom, 2)
                Text("Do or do not, there is no try")
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 30)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -120)
    }
}

#Preview {
    HeaderView()
}
