//
//  HeaderView.swift
//  todo
//
//  Created by Huy Phan on 11/16/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let backgroundColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(backgroundColor)
                .rotationEffect(Angle(radians: angle))
            
            // Header
            VStack {
                Text(title)
                    .font(.system(size: 50))
                    .bold()
                    .foregroundColor(Color.white)
                    .padding(.bottom, 2)
                Text(subtitle)
                    .font(.system(size: 25))
                    .foregroundColor(Color.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -140)
    }
}

#Preview {
    HeaderView(
        title: "Title",
        subtitle: "Subtitle",
        angle: 1/Double.pi,
        backgroundColor: Color.cyan
    )
}
